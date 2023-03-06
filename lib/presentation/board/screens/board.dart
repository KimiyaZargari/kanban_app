import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/board/widgets/empty_column_drag_target.dart';
import 'package:kanban_app/presentation/board/widgets/task_card.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';

class ProjectBoardPage extends ConsumerWidget {
  const ProjectBoardPage({@pathParam required int id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(boardNotifierProvider);
    final notifier = ref.watch(boardNotifierProvider.notifier);
    return PageBase(
        title: 'Board',
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_rounded),
        ),
        child: Column(
          children: [
            Card(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: const [
                    Expanded(child: Text('To Do', textAlign: TextAlign.center)),
                    Expanded(
                        child:
                            Text('In Progress', textAlign: TextAlign.center)),
                    Expanded(child: Text('Done', textAlign: TextAlign.center)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: notifier.todo.isEmpty
                        ? const EmptyColumDragTarget()
                        : ListView(
                            children: notifier.todo
                                .map((e) => TaskCard(
                                      e,
                                      column: 'todo',
                                    ))
                                .toList(),
                          ),
                  ),
                  Expanded(
                    child: Container(
                      child: notifier.inProgress.isEmpty
                          ? EmptyColumDragTarget()
                          : Column(
                              children: notifier.inProgress
                                  .map((e) => TaskCard(
                                        e,
                                        column: 'in progress',
                                      ))
                                  .toList(),
                            ),
                    ),
                  ),
                  Expanded(
                    child: notifier.done.isEmpty
                        ? EmptyColumDragTarget()
                        : Column(
                            children: notifier.done
                                .map((e) => TaskCard(
                                      e,
                                      column: 'done',
                                    ))
                                .toList(),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
