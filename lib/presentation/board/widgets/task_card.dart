import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/presentation/board/widgets/task_dialog.dart';
import '../../../domain/core/enums.dart';
import 'package:kanban_app/presentation/board/notifiers/timer_notifier.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
final int projectId;
  final double width;
  final Function() logTime, onDelete;

  const TaskCard(this.task,
      {required this.logTime,
        required this.projectId,
      required this.width,
      required this.onDelete,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => TaskDialog(
                    task,
                    projectId: projectId,
                    logTime: logTime,
                    onDelete: onDelete,
                  ));
        },
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                minHeight: width / 1.2,
              ),
              width: width,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        task.title,
                        //textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodySmall,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      if (task.status == TaskStatus.inProgress.toString())
                        Consumer(builder: (context, ref, _) {
                          ref.watch(timerProvider(task.id!));
                          final timerNotifier =
                              ref.watch(timerProvider(task.id!).notifier);
                          if (timerNotifier.timer == null &&
                              (task.intervals?.length.isOdd ?? false)) {
                            timerNotifier.startTimer();
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                (task.getDurationString()),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              if (task.intervals!.length.isOdd)
                                GestureDetector(
                                    onTap: () {
                                      timerNotifier.cancelTimer();
                                      logTime();
                                    },
                                    child: Icon(
                                      Icons.pause,
                                      size: 22,
                                      color: Theme.of(context).colorScheme.error,
                                    ))
                              else
                                GestureDetector(
                                    onTap: () {
                                      timerNotifier.startTimer();
                                      logTime();
                                    },
                                    child: Icon(
                                      Icons.play_arrow_rounded,
                                      size: 22,
                                      color: Theme.of(context).colorScheme.error,
                                    ))
                            ],
                          );
                        })
                      else if (task.status == TaskStatus.done.toString())
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                DateFormat('dd/MM/yy')
                                    .format(task.completedAt!)
                                    .toString(),
                                style: Theme.of(context).textTheme.bodySmall),
                            Icon(
                              Icons.check,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
