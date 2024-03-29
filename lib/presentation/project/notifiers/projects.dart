import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/application/project/create_project.dart';
import 'package:kanban_app/application/project/delete_project.dart';
import 'package:kanban_app/application/project/get_projects.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_entity.dart';
import 'package:kanban_app/infrastructure/project/project_repository.dart';

part 'projects.freezed.dart';

part 'projects_state.dart';

final projectsNotifierProvider =
    StateNotifierProvider.autoDispose<ProjectsNotifier, ProjectsState>((ref) =>
        ProjectsNotifier(repository: ref.watch(projectRepositoryProvider)));

class ProjectsNotifier extends StateNotifier<ProjectsState> {
  IProjectRepository repository;
  late List<ProjectEntity> projects;
  final createProjectTextController = TextEditingController();
  final createProjectKey = GlobalKey<FormState>();

  ProjectsNotifier({required this.repository}) : super(_Initial());

  getProjects() async {
    GetProjects getProjects = GetProjects(repository);
    projects = await getProjects(unit);
    state = _Loaded();
  }

  deleteProject(int projectId) {
    DeleteProject deleteProject = DeleteProject(repository);
    deleteProject(projectId);
    getProjects();
  }
}
