import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/domain/project/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    ));
  }
}
