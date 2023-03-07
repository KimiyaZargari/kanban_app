import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCard extends StatelessWidget {
  final String name;
  final bool isFeedback;

  const TaskCard(this.name, {this.isFeedback = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (index == 0) RegularDragTarget(column: column, index: index),
        AspectRatio(
          aspectRatio: 1,
          child: Card(
            color: isFeedback ? Theme.of(context).primaryColor : null,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodySmall,
                    softWrap: true,
                  )
                ],
              ),
            ),
          ),
        ),
        //     RegularDragTarget(column: column, index: index + 1)
      ],
    );
  }
}
