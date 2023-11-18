import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/domain/board/task_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/board/notifiers/create_edit_task.dart';
import 'package:kanban_app/presentation/board/widgets/select_task_status.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import '../../../domain/core/enums.dart';

@RoutePage()
class CreateEditTaskPage extends ConsumerWidget {
  final int projectId;
  final TaskEntity? task;

  const CreateEditTaskPage(
      {@PathParam('id') required this.projectId, this.task, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(createTaskNotifierProvider(projectId));
    final notifier = ref.watch(createTaskNotifierProvider(projectId).notifier);
    state.maybeWhen(
        orElse: () {},
        initial: () {
          if (task != null) notifier.setInitialData(task!);
        });
    ref.listen(createTaskNotifierProvider(projectId),
        (CreateEditTaskState? previous, CreateEditTaskState next) {
      next.mapOrNull(loaded: (_) {
        Fluttertoast.showToast(
            msg: 'Task Created Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Theme.of(context).cardColor,
            textColor: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: 16.0
        );
        context.router.pop();
      }, initial: (_) {
        previous?.mapOrNull(loading: (_) {
          Fluttertoast.showToast(
              msg: 'Task Created Successfully',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Theme.of(context).cardColor,
              textColor: Theme.of(context).textTheme.bodyMedium!.color,
              fontSize: 16.0
          );
        });
      });
    });
    return WillPopScope(
      onWillPop: () {
        ///refresh board and projects page to correctly reflect new data
        ref.read(boardNotifierProvider(projectId).notifier).getData();
        ref.read(projectsNotifierProvider.notifier).getProjects();
        return Future(() => true);
      },
      child: PageBase(
          title: task == null ? AppStrings.createTask : AppStrings.editTask,
          child: Form(
            key: notifier.formKey,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    height: MediaQuery.sizeOf(context).height -
                        80 -
                        MediaQuery.of(context).padding.top,
                    child: Column(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
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
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
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
                                  child: const Text(AppStrings.cancel)),
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

                                        notifier.editTask(
                                            task!,
                                            notifier.title!,
                                            notifier.description);
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
                                        final task = TaskEntity(
                                            id: null,
                                            title: notifier.title!,
                                            status: status.toString(),
                                            description:
                                                notifier.description?.trim(),
                                            completedAt:
                                                status == TaskStatus.done
                                                    ? notifier.completedAt
                                                    : null,
                                            intervals: status ==
                                                        TaskStatus.inProgress &&
                                                    ref.read(
                                                        startTimerNotifierProvider)
                                                ? [DateTime.now()]
                                                : []);
                                        notifier.createTask(
                                            task, createAnother);
                                      }
                                    },
                                    child: const Text(AppStrings.create)),
                          )
                        ],
                      );
                    }),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
