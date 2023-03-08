import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';

part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  ProjectModel._();

  factory ProjectModel({
    int? id,
    required String name,
    @JsonKey(name: 'To Do') required int todo,
    @JsonKey(name: 'Done')  required int done,
   @JsonKey(name: 'In Progress') required int inProgress,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);
}
