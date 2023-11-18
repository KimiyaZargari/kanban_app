import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/application/board/create_task.dart';
import 'package:kanban_app/application/board/delete_task.dart';
import 'package:kanban_app/application/board/edit_task.dart';
import 'package:kanban_app/application/board/get_board_data.dart';
import 'package:kanban_app/domain/board/task_entity.dart';
import 'package:kanban_app/infrastructure/board/board_repository.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/board/i_board_repository.dart';
import '../../../domain/core/enums.dart';
import '../../../infrastructure/core/local_database.dart';

part 'board.freezed.dart';

part 'board_state.dart';

final boardNotifierProvider = StateNotifierProvider.autoDispose
    .family<BoardNotifier, BoardState, int>((ref, projectId) =>
    BoardNotifier(
        repository: ref.watch(boardRepositoryProvider), projectId: projectId));
final dragTaskNotifierProvider = StateProvider<bool>((ref) => false);

class BoardNotifier extends StateNotifier<BoardState> {
  final int projectId;
  IBoardRepository repository;

  BoardNotifier({required this.repository, required this.projectId})
      : super(_Initial());
  late Map<String, List<TaskEntity>> tasks;



  deleteTask(TaskEntity task) async {
    DeleteTask deleteTask = DeleteTask(repository);
    await deleteTask(task.id!);
    tasks[task.status]!.remove(task);
    state = _Loaded();
  }

  getData() async {
    GetBoardData getBoardData = GetBoardData(repository);
    tasks = await getBoardData(projectId);
    state = _Loaded();
  }

  takeTaskToToDo({required TaskEntity task, int? at}) async {
    tasks[task.status]?.remove(task);
    List<DateTime> intervals = [];
    task.intervals = intervals;
    task.completedAt = null;
    await _changeTaskStatus(
        task: task, toStatus: TaskStatus.toDo.toString(), at: at);
  }

  logTaskTime({required TaskEntity task}) async {
    List<DateTime> intervals =
    task.intervals == null ? [] : [...task.intervals!];
    intervals.add(DateTime.now());

    EditTask editTask = EditTask(repository);
    final newTask = TaskEntity(
        title: task.title,
        status: task.status,
        id: task.id,
        description: task.description,
        intervals: intervals,
        completedAt: task.completedAt);
    await editTask(EditTaskEntity(oldTask: task, newTask: newTask));
    final index = tasks[task.status]!.indexOf(task);
    tasks[task.status]!.replaceRange(index, index + 1, [newTask]);
    state = BoardState.loaded();
  }

  takeTaskToInProgress({required TaskEntity task,
    required bool shouldStartTimer,
    int? at}) async {
    tasks[task.status]?.remove(task);
    List<DateTime> intervals =
    task.intervals == null ? [] : [...task.intervals!];

    if (shouldStartTimer) intervals.add(DateTime.now());
    task.intervals = intervals;
    task.completedAt = null;
    await _changeTaskStatus(
        task: task, toStatus: TaskStatus.inProgress.toString(), at: at);
  }


  takeTaskToDone({required TaskEntity task,
    required DateTime? completion,
    int? at}) async {
    tasks[task.status]?.remove(task);
    List<DateTime> intervals =
    task.intervals == null ? [] : [...task.intervals!];

    if (intervals.length.isOdd) intervals.add(DateTime.now());
    task.intervals = intervals;
    if (completion != null) task.completedAt = completion;
    await _changeTaskStatus(
        task: task, toStatus: TaskStatus.done.toString(), at: at);
  }

  _changeTaskStatus(
      {required TaskEntity task, required String toStatus, int? at}) async {
    final newTask = TaskEntity(
      status: toStatus,
      id: task.id,
      description: task.description,
      intervals: task.intervals,
      completedAt: task.completedAt,
      title: task.title,
    );
    if (at == null || at > tasks[toStatus]!.length) {
      tasks[toStatus]?.add(newTask);
    } else {
      tasks[toStatus]?.insert(at, newTask);
    }
    EditTask editTask = EditTask(repository);
    await editTask(EditTaskEntity(oldTask: task, newTask: newTask));
    state = _Loaded();
  }

  Future<bool> exportCsv(String name) async {
    final list = [
      [
        'id',
        'name',
        'status',
        'duration',
        'completedAt',
      ]
    ];
    for (List<TaskEntity> tasks in tasks.values) {
      for (TaskEntity task in tasks) {
        list.add(task.getCsvStringList());
      }
    }
    final res = const ListToCsvConverter().convert(list);
    final appDir = await getExternalStorageDirectory();
    final path = '${appDir!.absolute.path}/$name.csv';
    File csv = File(path);
    csv.writeAsString(res);
    await FlutterShare.shareFile(
      title: 'Project summery document',
      filePath: path,
    );
    return false;
  }

  @override
  void dispose() {
    String baseName = '${DatabaseKeys.boardKey}_$projectId';
    Hive.box(baseName).close();
    super.dispose();
  }
}
