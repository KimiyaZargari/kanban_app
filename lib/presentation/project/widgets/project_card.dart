import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../routes/router.gr.dart';
import 'delete_project_dialog.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        confirmDismiss: (_) async {
          showDialog(context: context, builder: (_) => DeleteProjectDialog());
        },
        key: Key(project.name),
        onDismissed: (direction) {},
        background: Card(
          color: Theme.of(context).colorScheme.error,
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: Icon(Icons.delete),
          ),
        ),
        child: InkWell(
          onTap: () {
            context.router.push(ProjectBoardRoute(id: project.id!));
          },
          child: Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                  child: Text(
                    project.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Divider(
                  height: 40,
                ),
                Row(
                  children: [
                    _getTaskNumberColumn('To Do', project.todo, context),
                    _getTaskNumberColumn(
                        'In Progress', project.inProgress, context),
                    _getTaskNumberColumn('Done', project.done, context)
                  ],
                )
              ],
            ),
          )),
        ));
  }

  Widget _getTaskNumberColumn(
          String status, int number, BuildContext context) =>
      Expanded(
        child: Column(
          children: [
            Text(
              status,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              number.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
}
