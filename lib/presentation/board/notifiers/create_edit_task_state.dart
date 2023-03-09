part of 'create_edit_task.dart';

@freezed
class CreateEditTaskState with _$CreateEditTaskState {
  factory CreateEditTaskState.initial() = _Initial;

  factory CreateEditTaskState.loading() = _Loading;
  factory CreateEditTaskState.loaded() = _Loaded;
  factory CreateEditTaskState.duplicateTask() = _DuplicateTask;


  factory CreateEditTaskState.networkError(String message) = _NetworkError;
}
