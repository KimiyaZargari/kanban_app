import 'package:dartz/dartz.dart';
import 'package:kanban_app/infrastructure/project/project_dto.dart';

abstract class IProjectRepository {
  Future<List<ProjectDto>> getProjects();

  Future<Either<Exception, int>> createProject(ProjectDto project);

  void deleteProject(int projectId);

  Future<Either<Exception, Unit>> editProject(ProjectDto projectModel);
}
