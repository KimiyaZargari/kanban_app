import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';

import '../notifiers/drag_task.dart';

class TaskCard extends StatelessWidget {
  final String name, column;

  const TaskCard(this.name, {required this.column, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(builder: (context, ref, __) {
          final notifier = ref.watch(boardNotifierProvider.notifier);
          return LongPressDraggable<String>(
            data: name,
            onDragStarted: () {
              ref.read(dragTaskNotifierProvider.notifier).startDragging(column);
            },
            onDragEnd: (_) {
              ref.read(dragTaskNotifierProvider.notifier).endDragging();
            },
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
        }),
        Consumer(builder: (context, ref, _) {
          final dragging = ref.watch(dragTaskNotifierProvider);
          final draggingNotifier = ref.watch(dragTaskNotifierProvider.notifier);
          return Visibility(
            visible: dragging && column != draggingNotifier.itemDraggedFrom,
            child: DragTarget(
                builder: (_, __, ___) => AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        color: Theme.of(context).disabledColor,
                      ),
                    )),
          );
        })
      ],
    );
  }
}
