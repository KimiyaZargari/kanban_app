part of 'create_project.dart';

@freezed
class CreateProjectState with _$CreateProjectState {
  factory CreateProjectState.initial() = _Initial;

  factory CreateProjectState.created(int projectId) = _Created;

  factory CreateProjectState.creating() = _Creating;

  factory CreateProjectState.projectExists() = _ProjectExists;

  factory CreateProjectState.networkError(String message) = _NetworkError;
}
