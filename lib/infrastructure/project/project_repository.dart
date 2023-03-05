import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';

final projectRepositoryProvider = Provider((ref) => ProjectRepository());

class ProjectRepository implements IProjectRepository {
  late Box<Map> projectsBox;

  ProjectRepository() ;



  @override
  Future<void> openBox() async {
    projectsBox = await Hive.openBox(DatabaseKeys.projectKey);
  }

  @override
  Future<void> closeBox() async {
    await projectsBox.close();
  }

  @override
  void createProject(ProjectModel project) {
    // TODO: implement createProject
    throw UnimplementedError();
  }

  @override
  void deleteProject(int projectId) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  void editProject(ProjectModel projectModel) {
    // TODO: implement editProject
    throw UnimplementedError();
  }

  @override
  List<ProjectModel> getProjects() {
    return List<ProjectModel>.from(projectsBox.values
        .map((e) => ProjectModel.fromJson(jsonDecode(e.toString()))));
  }
}
