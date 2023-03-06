import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/board/widgets/task_card.dart';

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
          child: Icon(Icons.add_rounded),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  color: Theme.of(context).cardColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('To Do'),
                )),
                Expanded(
                    child: Container(
                  color: Theme.of(context).cardColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('In Progress'),
                )),
                Expanded(
                    child: Container(
                  color: Theme.of(context).cardColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Done'),
                )),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: notifier.todo
                            .map((e) => Draggable(
                                  data: e,
                                  child: TaskCard(e),
                                  feedback: TaskCard(e),
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: notifier.inProgress
                              .map((e) => TaskCard(e))
                              .toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: notifier.done
                            .map((e) => Draggable(
                                data: e,
                                feedback: TaskCard(e),
                                child: TaskCard(e)))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
