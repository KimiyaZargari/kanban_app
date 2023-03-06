import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/application/project/create_project.dart';
import 'package:kanban_app/application/project/get_projects.dart';
import 'package:kanban_app/application/project/open_projects_box.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/infrastructure/project/project_repository.dart';

import '../../../domain/core/no_param.dart';
import '../../../domain/project/project_model.dart';

part 'create_project.freezed.dart';

part 'create_project_state.dart';

final createProjectNotifierProvider =
    StateNotifierProvider<CreateProjectNotifier, CreateProjectState>((ref) =>
        CreateProjectNotifier(
            repository: ref.watch(projectRepositoryProvider)));

class CreateProjectNotifier extends StateNotifier<CreateProjectState> {
  IProjectRepository repository;
  late String projectName;
  final createProjectKey = GlobalKey<FormState>();

  CreateProjectNotifier({required this.repository}) : super(_Initial());

  createProject() async {
    state = _Creating();
    CreateProject createProject = CreateProject(repository);
    (await createProject(ProjectModel(name: projectName, numberOfTasks: 0)))
        .fold((l) => state = _ProjectExists(), (r) => state = _Created(r));
  }
}
