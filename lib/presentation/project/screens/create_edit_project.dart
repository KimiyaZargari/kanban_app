import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/presentation/core/widgets/loading_widget.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/project/notifiers/create_project.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

import '../../core/config/strings.dart';

@RoutePage()
class CreateEditProjectPage extends ConsumerWidget {
  final ProjectModel? project;

  const CreateEditProjectPage({this.project, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(createProjectNotifierProvider.notifier);
    final state = ref.watch(createProjectNotifierProvider);
    ref.listen(createProjectNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          created: (id) {
            ref.read(projectsNotifierProvider.notifier).getProjects();
            if (project == null) {
              context.router.popAndPush(
                  ProjectBoardRoute(id: id, projectName: notifier.projectName));
            } else {
              context.router.pop();
            }
          });
    });

    return PageBase(
      title:
          project == null ? AppStrings.createProject : AppStrings.editProject,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Form(
                      key: notifier.createProjectKey,
                      child: AppTextField(
                        label: 'Project Name',
                        initialValue: project?.name,
                        onSaved: (val) {
                          notifier.projectName = val!;
                        },
                        validator: (val) {
                          if (val?.trim().isEmpty ?? true) {
                            return 'Please enter the project name!';
                          }
                          return null;
                        },
                        maxLength: 40,
                      ),
                    ),
                  ),
                  state.maybeWhen(
                      orElse: () => Container(),
                      projectExists: () => Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              'This project already exits!',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: const Text(AppStrings.cancel),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Consumer(builder: (context, ref, _) {
                    return Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (notifier.createProjectKey.currentState
                                  ?.validate() ??
                              false) {
                            notifier.createProjectKey.currentState!.save();
                            if (project == null) {
                              notifier.createProject();
                            } else {
                              notifier.editProject(project!);
                            }
                          }
                        },
                        child: state.maybeWhen(
                          creating: () => const LoadingWidget(),
                          orElse: () => Text(project == null
                              ? AppStrings.create
                              : AppStrings.save),
                        ),
                      ),
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
