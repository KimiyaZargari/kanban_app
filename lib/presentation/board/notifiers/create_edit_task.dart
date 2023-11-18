import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/board/task_entity.dart';
import 'package:kanban_app/infrastructure/board/board_repository.dart';

import '../../../application/board/create_task.dart';
import '../../../application/board/edit_task.dart';
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

  editTask(TaskEntity oldTask, String title, String? description) async {
    state = _Loading();
    final newTask = TaskEntity(
        id: oldTask.id,
        title: title,
        description: description,
        status: oldTask.status,
        intervals: oldTask.intervals,
        completedAt: oldTask.completedAt);
    final data = EditTaskEntity(newTask: newTask, oldTask: oldTask);
    EditTask editTask = EditTask(repository);
    return (await editTask(data)).fold((l) {
      state = _DuplicateTask();
    }, (r) {
      state = _Loaded();
    });
  }

  createTask(TaskEntity task, bool createAnother) async {
    CreateTask createTask = CreateTask(repository);
    return (await createTask(task)).fold((l) {
      state = _DuplicateTask();
    }, (r) {
      if (createAnother) {
        _clearDataForNextTask();
        state = _Initial();
      } else {
        state = _Loaded();
      }
    });
  }

  _clearDataForNextTask() {
    titleController.clear();
    descriptionController.clear();
  }

  setInitialData(TaskEntity task) {
    titleController.text = task.title;
    descriptionController.text = task.description ?? '';
  }

  notifyCreateAnotherTask() {}
}
