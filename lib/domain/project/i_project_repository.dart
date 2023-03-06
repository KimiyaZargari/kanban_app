import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/project/project_model.dart';

abstract class IProjectRepository {
  Future<void> openBox();

  Future<void> closeBox();

  List<ProjectModel> getProjects();

  Either<Exception, Unit> createProject(ProjectModel project);

  void deleteProject(int projectId);

  void editProject(ProjectModel projectModel);
}
