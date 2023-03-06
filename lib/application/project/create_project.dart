import 'package:dartz/dartz.dart';
import 'package:kanban_app/application/core/usecase.dart';
import 'package:kanban_app/domain/core/no_param.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';

class CreateProject implements UseCase<ProjectModel, Either<Exception, int>> {
  IProjectRepository repository;

  CreateProject(this.repository);

  @override
  Future<Either<Exception, int>> call(project) async {
    return  repository.createProject(project);
  }
}
