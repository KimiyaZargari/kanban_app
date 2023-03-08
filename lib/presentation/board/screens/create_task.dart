import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/board/notifiers/create_task.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';
import 'package:intl/intl.dart';
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
    return PageBase(
        title: AppStrings.createTask,
        child: Form(
          key: notifier.formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(22),
                  children: [
                    AppTextField(
                      label: AppStrings.title,
                      onSaved: (val) {
                        notifier.title = val!;
                      },
                      maxLength: 30,
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
                    Consumer(builder: (context, ref, _) {
                      final taskStatus =
                          ref.watch(newTaskStateNotifierProvider);
                      final startTimer = ref.watch(startTimerNotifierProvider);
                      final taskStatusNotifier =
                          ref.watch(newTaskStateNotifierProvider.notifier);
                      final startTimerNotifier =
                          ref.watch(startTimerNotifierProvider.notifier);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DropdownMenu<TaskStatus>(
                              initialSelection: taskStatus,
                              onSelected: (val) {
                                if (val != null) taskStatusNotifier.state = val;
                              },
                              dropdownMenuEntries: [
                                DropdownMenuEntry(
                                    leadingIcon:
                                        Icon(TaskStatus.toDo.getIcon()),
                                    value: TaskStatus.toDo,
                                    label: TaskStatus.toDo.toString()),
                                DropdownMenuEntry(
                                    leadingIcon:
                                        Icon(TaskStatus.inProgress.getIcon()),
                                    value: TaskStatus.inProgress,
                                    label: TaskStatus.inProgress.toString()),
                                DropdownMenuEntry(
                                    leadingIcon:
                                        Icon(TaskStatus.done.getIcon()),
                                    value: TaskStatus.done,
                                    label: TaskStatus.done.toString()),
                              ]),
                          if (taskStatus == TaskStatus.inProgress)
                            Row(
                              children: [
                                Checkbox(
                                    value: startTimer,
                                    onChanged: (val) {
                                      if (val != null) {
                                        startTimerNotifier.state = val;
                                      }
                                    }),
                                Text(
                                  'Start task timer',
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            )
                          else if (taskStatus == TaskStatus.done)
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: AppTextField(
                                readOnly: true,
                                controller: notifier.completedAtController,
                                validator: (val) {
                                  if (val?.trim().isEmpty ?? true) {
                                    return 'Please enter task completion date';
                                  }
                                  return null;
                                },
                                label: AppStrings.completedAt,
                                onTap: () async {
                                  final time = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime.now());
                                  if (time != null) {
                                    notifier.completedAt = time;
                                    notifier.completedAtController.text =
                                        DateFormat('dd  MMM  yyyy')
                                            .format(time)
                                            .toString();
                                  }
                                },
                              ),
                            )
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      maxLines: 5,
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
                child: Row(
                  children: [
                    Consumer(builder: (context, ref, _) {
                      final createAnother =
                          ref.watch(createAnotherTaskNotifierProvider);
                      final createAnotherNotifier =
                          ref.watch(createAnotherTaskNotifierProvider.notifier);
                      return Checkbox(
                          value: createAnother,
                          onChanged: (val) {
                            if (val != null) {
                              createAnotherNotifier.state = val;
                            }
                          });
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
                          onPressed: () {
                            if (notifier.formKey.currentState?.validate() ??
                                false) {
                              notifier.formKey.currentState!.save();
                              final status =
                                  ref.read(newTaskStateNotifierProvider);
                              ref
                                  .read(
                                      boardNotifierProvider(projectId).notifier)
                                  .createTask(TaskModel(
                                      name: notifier.title!,
                                      status: status.toString(),
                                      completedAt: status == TaskStatus.done
                                          ? notifier.completedAt
                                          : null,
                                      intervals: status ==
                                                  TaskStatus.inProgress &&
                                              ref.read(
                                                  startTimerNotifierProvider)
                                          ? [DateTime.now()]
                                          : []));
                            }
                          },
                          child: const Text(AppStrings.create)),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
