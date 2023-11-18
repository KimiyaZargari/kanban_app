import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kanban_app/domain/board/task_entity.dart';
import 'package:kanban_app/presentation/board/widgets/delete_task_dialog.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';
import '../../../domain/core/enums.dart';
import '../notifiers/timer_notifier.dart';

class TaskDialog extends StatelessWidget {
  final TaskEntity task;
  final int projectId;

  final Function() logTime, onDelete;

  const TaskDialog(this.task,
      {required this.logTime,
      required this.projectId,
      required this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(22),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                task.title,
                style: Theme.of(context).textTheme.titleLarge,
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Text(
                    task.status,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(taskValues.map[task.status]!.getIcon())
                ],
              ),
            ),
            if (task.status != TaskStatus.toDo.toString())
              Consumer(builder: (context, ref, _) {
                final timerNotifier =
                    ref.watch(timerProvider(task.id!).notifier);
                ref.watch(timerProvider(task.id!));
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time Spent:  ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(task.getDurationString(),
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                );
              }),
            if (task.status == TaskStatus.done.toString())
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed at: ',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                      DateFormat('dd MMM yyy')
                          .format(task.completedAt!)
                          .toString(),
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            if (task.description != null && task.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description: ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      task.description!,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 4),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (_) => DeleteTaskDialog()).then((value) {
                            if (value) {
                              onDelete();
                              context.router.pop();
                            }
                          });
                        },
                        child: const Text(AppStrings.delete)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          context.router.popAndPush(CreateEditTaskRoute(
                              projectId: projectId, task: task));
                        },
                        child: const Text(AppStrings.edit)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
