import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/application/board/create_task.dart';
import 'package:kanban_app/application/board/edit_task.dart';
import 'package:kanban_app/application/board/get_board_data.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/infrastructure/board/board_repository.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';
import '../../../domain/board/i_board_repository.dart';

part 'board.freezed.dart';

part 'board_state.dart';

final boardNotifierProvider = StateNotifierProvider.autoDispose
    .family<BoardNotifier, BoardState, int>((ref, projectId) => BoardNotifier(
        repository: ref.watch(boardRepositoryProvider), projectId: projectId));
final dragTaskNotifierProvider = StateProvider<bool>((ref) => false);

class BoardNotifier extends StateNotifier<BoardState> {
  final int projectId;
  IBoardRepository repository;

  BoardNotifier({required this.repository, required this.projectId})
      : super(_Initial());
  late Map<String, List<TaskModel>> tasks;

  Future<bool> createTask(TaskModel task) async {
    CreateTask createTask = CreateTask(repository);
    return (await createTask(task)).fold((l) {
      return false;
    }, (r) {
      tasks[task.status]!.add(task.copyWith(id: r));
      return true;
    });
  }

  getData() async {
    GetBoardData getBoardData = GetBoardData(repository);
    tasks = await getBoardData(projectId);
    state = _Loaded();
  }

  takeTaskToToDo({required TaskModel task, int? at}) async {
    tasks[task.status]?.remove(task);
    List<DateTime> intervals = [];
    task = task.copyWith(intervals: intervals, completedAt: null);
    await _changeTaskStatus(task: task, to: TaskStatus.toDo.toString(), at: at);
  }

  takeTaskToInProgress(
      {required TaskModel task,
      required bool shouldStartTimer,
      int? at}) async {
    tasks[task.status]?.remove(task);
    List<DateTime> intervals =
        task.intervals == null ? [] : [...task.intervals!];

    if (shouldStartTimer) intervals.add(DateTime.now());
    task = task.copyWith(intervals: intervals);
    await _changeTaskStatus(
        task: task, to: TaskStatus.inProgress.toString(), at: at);
  }

  takeTaskToDone(
      {required TaskModel task, required DateTime? completion, int? at}) async {
    tasks[task.status]?.remove(task);
    List<DateTime> intervals =
        task.intervals == null ? [] : [...task.intervals!];

    if (intervals.length.isOdd) intervals.add(DateTime.now());
    task = task.copyWith(
      intervals: intervals,
    );
    if (completion != null) task = task.copyWith(completedAt: completion);
    await _changeTaskStatus(task: task, to: TaskStatus.done.toString(), at: at);
  }

  _changeTaskStatus(
      {required TaskModel task, required String to, int? at}) async {
    final newTask = task.copyWith(status: to);
    if (at == null || at > tasks[to]!.length) {
      tasks[to]?.add(newTask);
    } else {
      tasks[to]?.insert(at, newTask);
    }
    EditTask editTask = EditTask(repository);
    await editTask(EditTaskModel(oldTask: task, newTask: newTask));
    state = _Loaded();
  }

  @override
  void dispose() {
    String baseName = '${DatabaseKeys.boardKey}_$projectId';
    Hive.box(baseName).close();
    super.dispose();
  }
}
