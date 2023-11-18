import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/project/project_entity.dart';
import 'package:kanban_app/infrastructure/project/project_dto.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class EditProject implements UseCase<ProjectEntity, Either<Exception, Unit>> {
  IProjectRepository repository;

  EditProject(this.repository);

  @override
  Future<Either<Exception, Unit>> call(project) async {
    return await repository.editProject(ProjectDto.fromEntity(project));
  }
}
