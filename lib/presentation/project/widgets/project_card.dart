import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/domain/project/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text(project.name),
        Column(
          children: [
            const Text('Tasks'),
            Text(project.numberOfTasks.toString()),
          ],
        )
      ],
    ));
  }
}
