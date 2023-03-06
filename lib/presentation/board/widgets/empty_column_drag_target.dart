import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/board.dart';
import '../notifiers/drag_task.dart';

class EmptyColumDragTarget extends ConsumerWidget {
  const EmptyColumDragTarget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final dragging = ref.watch(dragTaskNotifierProvider);
    return Visibility(
      visible: dragging,
      child: DragTarget(
          builder: (_, __, ___) => Card(
                color: Theme.of(context).disabledColor,
              )),
    );
  }
}
