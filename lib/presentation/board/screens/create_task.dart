import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/board/notifiers/create_task.dart';
import 'package:kanban_app/presentation/board/widgets/select_task_status.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';
import '../../../domain/board/task_model.dart';

class CreateTaskPage extends ConsumerWidget {
  const CreateTaskPage({@PathParam('id') required int projectId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final int projectId = context.router.stack
        .where((element) => element.name == CreateTaskRoute.name)
        .first
        .routeData
        .pathParams
        .getInt('id');
    final state = ref.watch(createTaskNotifierProvider(projectId));
    final notifier = ref.watch(createTaskNotifierProvider(projectId).notifier);
    ref.listen(createTaskNotifierProvider(projectId), (previous, next) {
      if (previous == CreateTaskState.creating() &&
          next == CreateTaskState.initial()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 10,
          content: Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Task Created Successfully',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          duration: const Duration(seconds: 3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Theme.of(context).cardColor)),
          backgroundColor: Theme.of(context).primaryColor,
        ));
        // Fluttertoast.showToast(
        //     msg: 'Task Successfully Created',
        //     backgroundColor: Theme.of(context).primaryColor,
        //     textColor: Theme.of(context).textTheme.bodyMedium!.color);
      } else if (next == CreateTaskState.created()) {
        context.router.pop();
      }
    });
    return PageBase(
        title: AppStrings.createTask,
        child: Form(
          key: notifier.formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(22),
                  children: [
                    AppTextField(
                      label: AppStrings.title,
                      onSaved: (val) {
                        notifier.title = val!;
                      },
                      controller: notifier.titleController,
                      maxLength: 100,
                      validator: (val) {
                        if (val?.trim().isEmpty ?? true) {
                          return 'Please enter task title!';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, bottom: 8, left: 8),
                      child: Text(
                        'Status',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    SelectTaskStatus(
                        projectId: projectId,
                        completedAtController: notifier.completedAtController),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      maxLines: 5,
                      controller: notifier.descriptionController,
                      label: AppStrings.description,
                      maxLength: 200,
                      onSaved: (val) {
                        notifier.description = val;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16))),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Consumer(builder: (context, ref, _) {
                  final createAnother =
                      ref.watch(createAnotherTaskNotifierProvider);
                  final createAnotherNotifier =
                      ref.watch(createAnotherTaskNotifierProvider.notifier);
                  return Row(
                    children: [
                      Checkbox(
                          value: createAnother,
                          onChanged: (val) {
                            if (val != null) {
                              createAnotherNotifier.state = val;
                            }
                          }),
                      Text(
                        AppStrings.createAnother,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (notifier.formKey.currentState?.validate() ??
                                  false) {
                                notifier.formKey.currentState!.save();
                                final status =
                                    ref.read(newTaskStateNotifierProvider);
                                final task = TaskModel(
                                    title: notifier.title!,
                                    status: status.toString(),
                                    completedAt: status == TaskStatus.done
                                        ? notifier.completedAt
                                        : null,
                                    intervals: status ==
                                                TaskStatus.inProgress &&
                                            ref.read(startTimerNotifierProvider)
                                        ? [DateTime.now()]
                                        : []);
                                notifier.notifyCreatingTask();
                                if (await ref
                                    .read(boardNotifierProvider(projectId)
                                        .notifier)
                                    .createTask(task)) {
                                  if (createAnother) {
                                    notifier.notifyCreateAnotherTask();
                                  } else {
                                    notifier.notifyTaskCreationFinished();
                                  }
                                }
                              }
                            },
                            child: const Text(AppStrings.create)),
                      )
                    ],
                  );
                }),
              )
            ],
          ),
        ));
  }
}
