import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/project/project_model.dart';

abstract class IProjectRepository {

  Future<List<ProjectModel>> getProjects();

  Future<Either<Exception, int>> createProject(ProjectModel project);

  void deleteProject(int projectId);

  Future<Either<Exception, Unit>> editProject(ProjectModel projectModel);
}
