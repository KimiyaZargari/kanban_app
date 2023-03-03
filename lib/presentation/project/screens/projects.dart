import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/loading_widget.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:kanban_app/presentation/project/widgets/create_project_dialog.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(projectsNotifierProvider);
    return PageBase(
        title: AppStrings.projects,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => CreateProjectDialog());
          },
          child: const Icon(Icons.add_rounded),
        ),
        child: state.maybeWhen(
          orElse: () => const LoadingWidget(),
        ));
  }
}
