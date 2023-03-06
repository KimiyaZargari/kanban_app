part of 'projects.dart';

@freezed
class ProjectsState with _$ProjectsState {
  factory ProjectsState.initial() = _Initial;

  factory ProjectsState.loaded() = _Loaded;

  factory ProjectsState.networkError(String message) = _NetworkError;
}
