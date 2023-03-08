import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/loading_widget.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:kanban_app/presentation/project/widgets/project_card.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(projectsNotifierProvider);
    final notifier = ref.watch(projectsNotifierProvider.notifier);
    return PageBase(
        title: AppStrings.projects,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(const CreateProjectRoute());
          },
          child: const Icon(Icons.add_rounded),
        ),
        child: state.maybeWhen(
          initial: () {
            notifier.getProjects();
            return const LoadingWidget();
          },
          loaded: () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
                child: Text(
                  notifier.projects.isNotEmpty
                      ? 'Swipe left to delete project and right to edit!'
                      : 'You have not created any projects yet!\nStart by clicking on the plus icon on the bottom right corner.',
                  textAlign: TextAlign.center,
                  style: notifier.projects.isNotEmpty
                      ? Theme.of(context).textTheme.bodyMedium
                      : Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(22),
                  children: notifier.projects
                      .map((project) => ProjectCard(
                            project,
                            deleteProject: () =>
                                notifier.deleteProject(project.id!),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          orElse: () => const LoadingWidget(),
        ));
  }
}
