import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';

final projectRepositoryProvider = Provider((ref) => ProjectRepository());

class ProjectRepository implements IProjectRepository {
  late Box<Map> projectsBox;

  ProjectRepository();

  @override
  Future<void> openBox() async {
    projectsBox = await Hive.openBox(DatabaseKeys.projectKey);
    //   projectsBox.clear();
  }

  @override
  Future<void> closeBox() async {
    await projectsBox.close();
  }

  @override
  Either<Exception, Unit> createProject(ProjectModel project) {
    if (projectsBox.values.where((element) => element['name']).isNotEmpty) {
      return left(Exception('This project alredy exists'));
    }
    int projectID = projectsBox.isEmpty ? 1 : projectsBox.values.last['id'] + 1;
    projectsBox.add(project.copyWith(id: projectID).toJson());
    return right(unit);
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
        .map((e) => ProjectModel.fromJson(jsonDecode(jsonEncode(e)))));
  }
}
