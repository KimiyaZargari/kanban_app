import 'package:kanban_app/application/core/usecase.dart';
import 'package:kanban_app/domain/core/no_param.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';

class CreateProject implements UseCase<ProjectModel, void> {
  IProjectRepository repository;

  CreateProject(this.repository);

  @override
  Future<void> call(project) async {
    return  repository.createProject(project);
  }
}
