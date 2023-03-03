import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/loading_widget.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBase(
        title: AppStrings.projects,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_rounded),
        ),
        child: const LoadingWidget());
  }
}
