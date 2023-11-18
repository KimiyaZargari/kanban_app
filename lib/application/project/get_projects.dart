import 'package:dartz/dartz.dart';
import 'package:kanban_app/application/core/usecase.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_entity.dart';

class GetProjects implements UseCase<Unit, List<ProjectEntity>> {
  IProjectRepository repository;

  GetProjects(this.repository);

  @override
  Future<List<ProjectEntity>> call(_) async {
    return (await repository.getProjects()).map((e) => e.toEntity()).toList();
  }
}
