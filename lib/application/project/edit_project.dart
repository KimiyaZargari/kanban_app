import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class EditProject implements UseCase<ProjectModel, Either<Exception, Unit>> {
  IProjectRepository repository;

  EditProject(this.repository);

  @override
  Future<Either<Exception, Unit>> call(project) async {
    print('in usecase');
    return await repository.editProject(project);
  }
}
