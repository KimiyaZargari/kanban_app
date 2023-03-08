import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/application/board/get_board_data.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/domain/core/no_param.dart';
import 'package:kanban_app/infrastructure/board/board_repository.dart';
import 'package:kanban_app/infrastructure/core/local_database.dart';

import '../../../domain/board/i_board_repository.dart';

part 'board.freezed.dart';

part 'board_state.dart';

final boardNotifierProvider = StateNotifierProvider.autoDispose
    .family<BoardNotifier, BoardState, int>((ref, projectId) => BoardNotifier(
        repository: ref.watch(boardRepositoryProvider), projectId: projectId));
final dragTaskNotifierProvider = StateProvider<bool>((ref) => false);
final newTaskStateNotifierProvider =
    StateProvider<TaskStatus>((ref) => TaskStatus.toDo);
final startTimerNotifierProvider = StateProvider<bool>((ref) => false);
final createAnotherTaskNotifierProvider = StateProvider<bool>((ref) => false);

class BoardNotifier extends StateNotifier<BoardState> {
  final int projectId;
  IBoardRepository repository;
  final TextEditingController completedAtController = TextEditingController();
  String? title, description;
  final formKey = GlobalKey<FormState>();

  BoardNotifier({required this.repository, required this.projectId})
      : super(_Initial());
  late Map<String, List<TaskModel>> tasks;

  createTask(){
    
  }
  getData() async {
    GetBoardData getBoardData = GetBoardData(repository);
    tasks = await getBoardData(projectId);
    state = _Loaded();
  }

  changeTaskStatus(
      {required TaskModel task,
      required String from,
      required String to,
      int? at}) {
    tasks[from]?.remove(task);
    if (at == null || at > tasks[to]!.length) {
      tasks[to]?.add(task);
    } else {
      tasks[to]?.insert(at, task);
    }
    state = _Loaded();
  }

  @override
  void dispose() {
    String baseName = '${DatabaseKeys.boardKey}_$projectId';
    Hive.box<Map>('${baseName}_todo').close();
    Hive.box<Map>('${baseName}_inProgress').close();
    Hive.box<Map>('${baseName}_done').close();
    super.dispose();
  }
}
