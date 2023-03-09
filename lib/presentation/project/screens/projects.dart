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
          loaded: () => notifier.projects.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 100, right: 20, left: 20),
                  child: Text(
                    'You have not created any projects yet!\nStart by clicking on the plus icon on the bottom right corner.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(12),
                  children: notifier.projects
                      .asMap()
                      .map((key, project) => MapEntry(
                            key,
                            Column(
                              children: [
                                if (key == 0)
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        22, 0, 22, 22),
                                    child: Text(
                                      'Swipe left to delete project and right to edit!',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                ProjectCard(
                                  project,
                                  deleteProject: () =>
                                      notifier.deleteProject(project.id!),
                                ),
                              ],
                            ),
                          ))
                      .values
                      .toList(),
                ),
          orElse: () => const LoadingWidget(),
        ));
  }
}
