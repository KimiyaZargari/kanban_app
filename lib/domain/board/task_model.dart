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
      String? description,
    required String status,
    List<DateTime>? intervals,
    DateTime? completedAt,
  }) = _TaskModel;

  Duration _getDuration() {
    if (intervals == null || intervals!.isEmpty) {
      return Duration.zero;
    }
    var res = Duration.zero;

    for (int i = 0; i < intervals!.length + 1; i += 2) {
      if (i + 1 < intervals!.length) {
        res += intervals![i + 1].difference(intervals![i]);
      } else {
        if (i < intervals!.length) {
          res += DateTime.now().difference(intervals![i]);
        }
      }
    }
    return res;
  }

  String getDurationString() {
    final res = _getDuration();
    int hours = res.inHours.remainder(24);
    int minutes = res.inMinutes.remainder(60);
    if (res.inDays != 0) {
      return "${res.inDays}:${hours < 10 ? '0$hours' : hours}:${minutes < 10 ? '0$minutes' : minutes}";
    } else if (res.inHours == 0) {
      return '${res.inMinutes} mins';
    } else {
      return "${hours < 10 ? '0$hours' : hours}:${minutes < 10 ? '0$minutes' : minutes}";
    }
  }

  List<String> getCsvStringList() {
    return [
      id.toString(),
      title,
      status,
      _getDuration().toString(),
      completedAt.toString()
    ];
  }

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

@freezed
class EditTaskModel with _$EditTaskModel {
  EditTaskModel._();

  factory EditTaskModel({
    required TaskModel oldTask,
    required TaskModel newTask,
  }) = _EditTaskModel;
}



