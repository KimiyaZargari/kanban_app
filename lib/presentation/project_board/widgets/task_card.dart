import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String name;

  const TaskCard(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Text(
                name,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodySmall,
                softWrap: true,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
