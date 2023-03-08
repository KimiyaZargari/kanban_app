part of 'create_task.dart';

@freezed
class CreateTaskState with _$CreateTaskState {
  factory CreateTaskState.initial() = _Initial;

  factory CreateTaskState.loading() = _Loading;
  factory CreateTaskState.created() = _Created;


  factory CreateTaskState.networkError(String message) = _NetworkError;
}
