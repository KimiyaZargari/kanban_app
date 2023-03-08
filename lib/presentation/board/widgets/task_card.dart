import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanban_app/domain/board/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final bool isFeedback;
  final double width;

  const TaskCard(this.task,
      {this.isFeedback = false, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: width,
          ),
          width: width,
          child: Card(
            color: isFeedback ? Theme.of(context).primaryColor : null,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall,
                    softWrap: true,
                  ),
                  if (task.status == TaskStatus.inProgress.toString())
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text((task.getDuration() ?? Duration.zero)
                            .toString()
                            .substring(0, 7)),
                        if (task.intervals!.length.isOdd)
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.pause))
                        else
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow_rounded))
                      ],
                    )
                  else if (task.status == TaskStatus.done.toString())
                    Text(DateFormat('dd MMM yyyy')
                        .format(task.completedAt!)
                        .toString())
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
