import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class CreateProject implements UseCase<ProjectModel, Either<Exception, int>> {
  IProjectRepository repository;

  CreateProject(this.repository);

  @override
  Future<Either<Exception, int>> call(project) async {
    return repository.createProject(project);
  }
}
