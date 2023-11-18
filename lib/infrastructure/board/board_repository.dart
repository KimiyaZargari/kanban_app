import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/infrastructure/board/task_dto.dart';

import '../../domain/core/enums.dart';
import '../core/local_database.dart';

final boardRepositoryProvider = Provider((ref) => BoardRepository());

class BoardRepository implements IBoardRepository {
  late final Box tasksBox;

  Future<void> _openBox(int projectId) async {
    final boxName = "${DatabaseKeys.boardKey}_$projectId";
    if (!Hive.isBoxOpen(boxName)) tasksBox = await Hive.openBox(boxName);
  }

  @override
  Future<Either<Exception, int>> createTask(TaskDto task) async {
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
  Future<Either<Exception, Unit>> editTask(
      {required TaskDto oldTask, required TaskDto newTask}) async {
    if (oldTask.title != newTask.title) {
      if (tasksBox.values
          .where((element) =>
              element['title'] == newTask.title && element['id'] != newTask.id)
          .isNotEmpty) {
        return left(Exception('This task already exists!'));
      }
    }
    await tasksBox.put(newTask.id!, newTask.toJson());
    if (oldTask.status != newTask.status) {
      _updateTaskNumber(oldTask.status, -1);
      _updateTaskNumber(newTask.status, 1);
    }
    return right(unit);
  }

  @override
  Future<Map<String, List<TaskDto>>> getBoardData(int projectId) async {
    await _openBox(projectId);
    Map<String, List<TaskDto>> tasks = {
      TaskStatus.toDo.toString(): [],
      TaskStatus.inProgress.toString(): [],
      TaskStatus.done.toString(): [],
    };

    for (var element in tasksBox.values) {
      final task = TaskDto.fromJson(jsonDecode(jsonEncode(element)));
      tasks[task.status]!.add(task);
    }
    return tasks;
  }
}
