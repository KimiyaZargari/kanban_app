import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String name;
  final bool isFeedback;
  final double width;

  const TaskCard(this.name,
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
      ],
    );
  }
}
