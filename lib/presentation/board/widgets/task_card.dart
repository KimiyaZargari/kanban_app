import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                children: [
                  Text(
                    task.name,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall,
                    softWrap: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
