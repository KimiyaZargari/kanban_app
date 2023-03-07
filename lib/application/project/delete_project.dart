import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class DeleteProject implements UseCase<int, void> {
  IProjectRepository repository;

  DeleteProject(this.repository);

  @override
  Future<void> call(projectId) async {
    return  repository.deleteProject(projectId);
  }
}
