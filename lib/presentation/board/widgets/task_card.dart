import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String name;

  const TaskCard(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<String>(
      data: name,
      childWhenDragging: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: Theme.of(context).disabledColor,
        ),
      ),
      feedback: Container(
        height: MediaQuery.of(context).size.width / 3 + 10,
        width: MediaQuery.of(context).size.width / 3 + 10,
        child: Card(
          elevation: 10,
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
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: 1,
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
    );
  }
}
