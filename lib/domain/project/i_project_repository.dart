import 'package:kanban_app/domain/project/project_model.dart';

abstract class IProjectRepository {
  Future<List<ProjectModel>> getProjects();

  Future<void> createProject(ProjectModel project);

  Future<void> deleteProject(int projectId);

  Future<void> editProject(ProjectModel projectModel);
}
