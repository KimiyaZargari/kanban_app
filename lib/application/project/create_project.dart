import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/project/project_entity.dart';
import 'package:kanban_app/infrastructure/project/project_dto.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class CreateProject implements UseCase<ProjectEntity, Either<Exception, int>> {
  IProjectRepository repository;

  CreateProject(this.repository);

  @override
  Future<Either<Exception, int>> call(project) async {
    return repository.createProject(ProjectDto.fromEntity(project));
  }
}
