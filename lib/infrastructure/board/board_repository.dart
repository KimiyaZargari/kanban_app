import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';

final boardRepositoryProvider =
    Provider.autoDispose((ref) => BoardRepository());

class BoardRepository implements IBoardRepository {
  late final Box tasksBox;

  BoardRepository();

  Future<void> _openBox(int projectId) async {
    final boxName = "${DatabaseKeys.boardKey}_$projectId";
    if (!Hive.isBoxOpen(boxName)) tasksBox = await Hive.openBox(boxName);
  }

  @override
  Future<Either<Exception, int>> createTask(TaskModel task) async {
    if (tasksBox.values
        .where((element) => element['title'] == task.title)
        .isNotEmpty) {
      return left(Exception('This task already exists!'));
    }
    final id = await tasksBox.add(task.toJson());
    final projectID = int.parse(tasksBox.name.characters.last);
    print(projectID);

    var project = Hive.box<Map>(DatabaseKeys.projectKey).get(projectID);
    project![task.status]++;
    Hive.box<Map>(DatabaseKeys.projectKey).put(projectID, project);
    await tasksBox.putAt(id, task.copyWith(id: id).toJson());
    return right(id);
  }

  @override
  void deleteTask(int id) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<void> editTask(TaskModel task) async {
    await tasksBox.putAt(task.id!, task.toJson());
  }

  @override
  Future<Map<String, List<TaskModel>>> getBoardData(int projectId) async {
    await _openBox(projectId);
    Map<String, List<TaskModel>> tasks = {
      TaskStatus.toDo.toString(): [],
      TaskStatus.inProgress.toString(): [],
      TaskStatus.done.toString(): [],
    };

    for (var element in tasksBox.values) {
      final task = TaskModel.fromJson(jsonDecode(jsonEncode(element)));
      tasks[task.status]!.add(task);
    }
    return tasks;
  }
}
