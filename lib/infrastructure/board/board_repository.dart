import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';

import '../../domain/core/enums.dart';

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

    await tasksBox.put(id, task.copyWith(id: id).toJson());
    _updateTaskNumber(task.status, 1);
    return right(id);
  }

  _updateTaskNumber(String status, int val) {
    final projectID =
        int.parse(tasksBox.name.substring(tasksBox.name.lastIndexOf('_') + 1));
    var project = Hive.box<Map>(DatabaseKeys.projectKey).get(projectID);
    project![status] += val;
    Hive.box<Map>(DatabaseKeys.projectKey).put(projectID, project);
  }

  @override
  void deleteTask(int id) async {
    await tasksBox.delete(id);
  }

  @override
  Future<Either<Exception, Unit>> editTask(EditTaskModel model) async {
    if (model.oldTask.title != model.newTask.title) {
      if (tasksBox.values
          .where((element) =>
              element['title'] == model.newTask.title &&
              element['id'] != model.newTask.id)
          .isNotEmpty) {
        return left(Exception('This task already exists!'));
      }
    }
    await tasksBox.put(model.newTask.id!, model.newTask.toJson());
    if (model.oldTask.status != model.newTask.status) {
      _updateTaskNumber(model.oldTask.status, -1);
      _updateTaskNumber(model.newTask.status, 1);
    }
    return right(unit);
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
