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
  late final Box<Map> toDoBox, inProgressBox, doneBox;

  BoardRepository();

  Future<void> _openBox(int projectId) async {
    final boxBaseName = "${DatabaseKeys.boardKey}_$projectId";
    await Future.wait<void>([
      _openToDo(boxBaseName),
      _openInProgressBox(boxBaseName),
      _openDoneBox(boxBaseName),
    ]);

    //   projectsBox.clear();
  }

  _openToDo(String boxName) async {
    final name = '${boxName}_todo';
    print(Hive.isBoxOpen(name));
    if (!Hive.isBoxOpen(name)) toDoBox = await Hive.openBox(name);
  }

  _openInProgressBox(String boxName) async {
    final name = '${boxName}_inProgress';
    if (!Hive.isBoxOpen(name)) inProgressBox = await Hive.openBox(name);
  }

  _openDoneBox(String boxName) async {
    final name = '${boxName}_done';
    if (!Hive.isBoxOpen(name)) doneBox = await Hive.openBox(name);
  }

  @override
  Either<Exception, int> createTask(TaskModel project) {
    throw UnimplementedError();
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
    List<TaskModel> todo, inProgress, done;
    todo = List<TaskModel>.from(toDoBox.values
        .map((e) => TaskModel.fromJson(jsonDecode(jsonEncode(e)))));
    inProgress = List<TaskModel>.from(inProgressBox.values
        .map((e) => TaskModel.fromJson(jsonDecode(jsonEncode(e)))));
    done = List<TaskModel>.from(doneBox.values
        .map((e) => TaskModel.fromJson(jsonDecode(jsonEncode(e)))));
    return {'To Do': todo, 'In Progress': inProgress, 'Done': done};
  }
}
