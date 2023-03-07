import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(project.id);
    return InkWell(
      onTap: () {
        context.router.push(ProjectBoardRoute(id: project.id!));
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: Text(
              project.name,
              style: Theme.of(context).textTheme.titleLarge,
            )),
            Column(
              children: [
                Text(
                  project.numberOfTasks.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'task(s)',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
