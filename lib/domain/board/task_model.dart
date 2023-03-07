import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  TaskModel._();

  factory TaskModel({
    int? id,
    required String name,
    required String status,
    required List<DateTime> intervals,
    required String completedAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);
}
