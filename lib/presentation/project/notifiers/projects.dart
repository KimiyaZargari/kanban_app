import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/application/project/create_project.dart';
import 'package:kanban_app/application/project/delete_project.dart';
import 'package:kanban_app/application/project/get_projects.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/infrastructure/project/project_repository.dart';

import '../../../domain/core/no_param.dart';
import '../../../domain/project/project_model.dart';

part 'projects.freezed.dart';

part 'projects_state.dart';

final projectsNotifierProvider =
    StateNotifierProvider.autoDispose<ProjectsNotifier, ProjectsState>((ref) =>
        ProjectsNotifier(repository: ref.watch(projectRepositoryProvider)));

class ProjectsNotifier extends StateNotifier<ProjectsState> {
  IProjectRepository repository;
  late List<ProjectModel> projects;
  final createProjectTextController = TextEditingController();
  final createProjectKey = GlobalKey<FormState>();

  ProjectsNotifier({required this.repository}) : super(_Initial());

  getProjects() async {
    GetProjects getProjects = GetProjects(repository);
    projects = await getProjects(NoParam());
    state = _Loaded();
  }

  //return validation result

  Future<bool> createProject(String name) async {
    if (createProjectKey.currentState?.validate() ?? false) {
      CreateProject createProject = CreateProject(repository);
      await createProject(
          ProjectModel(name: name, todo: 0, done: 0, inProgress: 0));
      getProjects();
      return true;
    }
    return false;
  }

  deleteProject(int projectId) {
    DeleteProject deleteProject = DeleteProject(repository);
    deleteProject(projectId);
    getProjects();
  }
}
