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

part 'create_task.freezed.dart';

part 'create_task_state.dart';

final createTaskNotifierProvider = StateNotifierProvider.autoDispose
    .family<CreateTaskNotifier, CreateTaskState, int>((ref, projectId) =>
        CreateTaskNotifier(
            repository: ref.watch(boardRepositoryProvider),
            projectId: projectId));

final newTaskStateNotifierProvider =
    StateProvider<TaskStatus>((ref) => TaskStatus.toDo);
final startTimerNotifierProvider = StateProvider<bool>((ref) => false);
final createAnotherTaskNotifierProvider = StateProvider<bool>((ref) => false);

class CreateTaskNotifier extends StateNotifier<CreateTaskState> {
  final int projectId;
  IBoardRepository repository;
  final TextEditingController completedAtController = TextEditingController();
  String? title, description;
  final formKey = GlobalKey<FormState>();

  CreateTaskNotifier({required this.repository, required this.projectId})
      : super(_Initial());
}
