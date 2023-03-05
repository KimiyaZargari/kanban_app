import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/application/project/get_projects.dart';
import 'package:kanban_app/application/project/open_projects_box.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/infrastructure/project/project_repository.dart';

import '../../../domain/core/no_param.dart';
import '../../../domain/project/project_model.dart';

part 'projects.freezed.dart';

part 'projects_state.dart';

final projectsNotifierProvider =
    StateNotifierProvider<ProjectsNotifier, ProjectsState>((ref) =>
        ProjectsNotifier(repository: ref.watch(projectRepositoryProvider)));

class ProjectsNotifier extends StateNotifier<ProjectsState> {
  IProjectRepository repository;
  late List<ProjectModel> projects;

  ProjectsNotifier({required this.repository}) : super(_Initial()) {
    _openProjectsBox();
  }

  _openProjectsBox() async {
    OpenProjectsBox openProjectsBox = OpenProjectsBox(repository);
    await openProjectsBox(NoParam());
  }
}
