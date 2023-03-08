import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';

final projectRepositoryProvider =
    Provider.autoDispose((ref) => ProjectRepository());

class ProjectRepository implements IProjectRepository {
  late final Box<Map> projectsBox;

  ProjectRepository();

  @override
  Future<void> _openBox() async {
    if (!Hive.isBoxOpen(DatabaseKeys.projectKey)) {
      projectsBox = await Hive.openBox(DatabaseKeys.projectKey);
    }
    //   projectsBox.clear();
  }

  @override
  Future<void> closeBox() async {
    await projectsBox.close();
  }

  @override
  Future<Either<Exception, int>> createProject(ProjectModel project) async {
    if (projectsBox.values
        .where((element) => element['name'] == project.name)
        .isNotEmpty) {
      return left(Exception('This project already exists!'));
    }
    int projectID = projectsBox.isEmpty ? 1 : projectsBox.values.last['id'] + 1;
    await projectsBox.put(projectID, project.copyWith(id: projectID).toJson());
    return right(projectID);
  }

  @override
  void deleteProject(int projectId) async {
    await projectsBox.delete(projectId);
  }

  @override
  void editProject(ProjectModel projectModel) {
    // TODO: implement editProject
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    await _openBox();
    return List<ProjectModel>.from(projectsBox.values
        .map((e) => ProjectModel.fromJson(jsonDecode(jsonEncode(e)))));
  }
}
