import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/board/notifiers/create_edit_task.dart';
import 'package:kanban_app/presentation/board/widgets/select_task_status.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import '../../../domain/board/task_model.dart';
import '../../../domain/core/enums.dart';

class CreateEditTaskPage extends ConsumerWidget {
  final int projectId;
  final TaskModel? task;

  const CreateEditTaskPage(
      {@PathParam('id') required this.projectId, this.task, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(createTaskNotifierProvider(projectId));
    final notifier = ref.watch(createTaskNotifierProvider(projectId).notifier);
    state.maybeWhen(
        orElse: () {},
        initial: () {
          if (task != null) notifier.setInitialData(task!);
        });
    ref.listen(createTaskNotifierProvider(projectId), (previous, next) {
      if (previous == CreateEditTaskState.loading() &&
          next == CreateEditTaskState.initial()) {
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
      } else if (next == CreateEditTaskState.loaded()) {
        context.router.pop();
      }
    });
    return WillPopScope(
      onWillPop: () {
        ref.read(boardNotifierProvider(projectId).notifier).getData();
        return Future(() => true);
      },
      child: PageBase(
          title: task == null ? AppStrings.createTask : AppStrings.editTask,
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
                      state.maybeWhen(
                          orElse: () => Container(),
                          duplicateTask: () => Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Task with this name already exists!',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              )),
                      if (task == null)
                        SelectTaskStatus(
                            projectId: projectId,
                            completedAtController:
                                notifier.completedAtController),
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
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16))),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Consumer(builder: (context, ref, _) {
                    final createAnother =
                        ref.watch(createAnotherTaskNotifierProvider);
                    final createAnotherNotifier =
                        ref.watch(createAnotherTaskNotifierProvider.notifier);

                    return Row(
                      children: [
                        if (task == null)
                          Row(
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
                            ],
                          )
                        else
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  context.router.pop();
                                },
                                child: Text(AppStrings.cancel)),
                          ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: task != null
                              ? ElevatedButton(
                                  onPressed: () async {
                                    if (notifier.formKey.currentState
                                            ?.validate() ??
                                        false) {
                                      notifier.formKey.currentState!.save();
                                      final editedTask = task!.copyWith(
                                        title: notifier.title!,
                                        description:
                                            notifier.description?.trim(),
                                      );
                                      notifier.notifyCreatingTask();
                                      if (await ref
                                          .read(boardNotifierProvider(projectId)
                                              .notifier)
                                          .editTask(EditTaskModel(
                                              oldTask: task!,
                                              newTask: editedTask))) {
                                        notifier.notifyTaskCreationFinished();
                                      } else {
                                        notifier.notifyDuplicateTask();
                                      }
                                    }
                                  },
                                  child: const Text(AppStrings.save))
                              : ElevatedButton(
                                  onPressed: () async {
                                    if (notifier.formKey.currentState
                                            ?.validate() ??
                                        false) {
                                      notifier.formKey.currentState!.save();
                                      final status = ref.read(
                                          selectedTaskStateNotifierProvider);
                                      final task = TaskModel(
                                          title: notifier.title!,
                                          status: status.toString(),
                                          description:
                                              notifier.description?.trim(),
                                          completedAt: status == TaskStatus.done
                                              ? notifier.completedAt
                                              : null,
                                          intervals: status ==
                                                      TaskStatus.inProgress &&
                                                  ref.read(
                                                      startTimerNotifierProvider)
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
                                      } else {
                                        notifier.notifyDuplicateTask();
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
          )),
    );
  }
}
