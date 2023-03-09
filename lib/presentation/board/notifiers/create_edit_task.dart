import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/infrastructure/board/board_repository.dart';

import '../../../domain/board/i_board_repository.dart';
import '../../../domain/core/enums.dart';

part 'create_edit_task.freezed.dart';

part 'create_edit_task_state.dart';

final createTaskNotifierProvider = StateNotifierProvider.autoDispose
    .family<CreateTaskNotifier, CreateEditTaskState, int>((ref, projectId) =>
        CreateTaskNotifier(
            repository: ref.watch(boardRepositoryProvider),
            projectId: projectId));

final selectedTaskStateNotifierProvider =
    StateProvider<TaskStatus>((ref) => TaskStatus.toDo);
final startTimerNotifierProvider = StateProvider<bool>((ref) => false);
final createAnotherTaskNotifierProvider = StateProvider<bool>((ref) => false);

class CreateTaskNotifier extends StateNotifier<CreateEditTaskState> {
  final int projectId;
  IBoardRepository repository;
  final TextEditingController completedAtController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? title, description;
  final formKey = GlobalKey<FormState>();
  DateTime? completedAt;

  CreateTaskNotifier({required this.repository, required this.projectId})
      : super(_Initial());

  _clearDataForNextTask() {
    titleController.clear();
    descriptionController.clear();
  }

  setInitialData(TaskModel task) {
    titleController.text = task.title;
    descriptionController.text = task.description ?? '';
  }

  notifyCreatingTask() {
    state = _Loading();
  }

  notifyTaskCreationFinished() {
    state = _Loaded();
  }

  notifyCreateAnotherTask() {
    _clearDataForNextTask();
    state = _Initial();
  }
}
