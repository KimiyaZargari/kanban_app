import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/project_board/widgets/task_card.dart';

class ProjectBoardPage extends StatelessWidget {
  const ProjectBoardPage({@pathParam required int id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> data = [
      'this is a task',
      'this is a task',
      'this is a task',
      'this is a task',
      'this is a task',
      'this is a task',
      'this is a task with a long name',
      'this is a taaaaaask with a veryyyy  long name',
      'normal name'
    ];
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
                      child: Column(children: []),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: data.map((e) => TaskCard(e)).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [],
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
