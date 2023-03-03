import 'package:kanban_app/application/core/usecase.dart';
import 'package:kanban_app/domain/core/no_param.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';

class GetProjects implements UseCase<NoParam, List<ProjectModel>> {
  IProjectRepository repository;

  GetProjects(this.repository);

  @override
  Future<List<ProjectModel>> call(_) async {
    return await repository.getProjects();
  }
}
