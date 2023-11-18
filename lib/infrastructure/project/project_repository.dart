import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';

final projectRepositoryProvider =
    Provider<ProjectRepository>((ref) => throw UnimplementedError());

class ProjectRepository implements IProjectRepository {
  late final Box<Map> projectsBox;

  ProjectRepository(this.projectsBox);


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
    await Hive.deleteBoxFromDisk('${DatabaseKeys.boardKey}_$projectId');
  }

  @override
  Future<Either<Exception, Unit>> editProject(ProjectModel projectModel) async {
    if (projectsBox.values
        .where((element) =>
            element['name'] == projectModel.name &&
            element['id'] != projectModel.id)
        .isNotEmpty) {
      return left(Exception('You already have a project with this name!'));
    }
    await projectsBox.put(projectModel.id!, projectModel.toJson());
    return right(unit);
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    return List<ProjectModel>.from(projectsBox.values
        .map((e) => ProjectModel.fromJson(jsonDecode(jsonEncode(e)))));
  }
}
