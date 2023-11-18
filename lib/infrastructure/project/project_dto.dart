import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/project/project_entity.dart';

part 'project_dto.freezed.dart';

part 'project_dto.g.dart';

@freezed
class ProjectDto with _$ProjectDto {
  ProjectDto._();

  factory ProjectDto({
    int? id,
    required String name,
    @JsonKey(name: 'To Do') required int todo,
    @JsonKey(name: 'Done') required int done,
    @JsonKey(name: 'In Progress') required int inProgress,
  }) = _ProjectDto;

  factory ProjectDto.fromEntity(ProjectEntity project) => ProjectDto(
      id: project.id,
      name: project.name,
      todo: project.todo,
      done: project.done,
      inProgress: project.inProgress);

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectDto && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  ProjectEntity toEntity() => ProjectEntity(
      name: name, inProgress: inProgress, done: done, todo: todo, id: id);
}
