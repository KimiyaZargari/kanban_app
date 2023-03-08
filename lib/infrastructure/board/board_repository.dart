import 'dart:convert';

import 'package:dartz/dartz.dart';
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
  Future<Either<Exception, Unit>> createTask(TaskModel task) async {
    if (tasksBox.values
        .where((element) => element['title'] == task.title)
        .isNotEmpty) {
      return left(Exception('This task already exists!'));
    }
    await tasksBox.add(task.toJson());
    return right(unit);
  }

  @override
  void deleteTask(int id) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  void editTask(TaskModel projectModel) {
    // TODO: implement editProject
    throw UnimplementedError();
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
