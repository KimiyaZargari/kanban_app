import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  TaskModel._();

  factory TaskModel({
    int? id,
    required String title,
    required String status,
     List<DateTime>? intervals,
     DateTime? completedAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskModel && other.id == id && other.title == title;
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);
}

enum TaskStatus {
  toDo,
  inProgress,
  done;

  @override
  String toString() {
    switch (this) {
      case TaskStatus.toDo:
        return 'To Do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
    }
  }

  IconData getIcon() {
    switch (this) {
      case TaskStatus.toDo:
        return Icons.list_alt_rounded;
      case TaskStatus.inProgress:
        return Icons.timelapse_rounded;
      case TaskStatus.done:
        return Icons.done_rounded;
    }
  }
}
