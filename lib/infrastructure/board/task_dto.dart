import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/board/task_entity.dart';

part 'task_dto.freezed.dart';

part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto {
  TaskDto._();
  factory TaskDto({
    int? id,
    required String title,
    String? description,
    required String status,
    List<DateTime>? intervals,
    DateTime? completedAt,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  factory TaskDto.fromEntity(TaskEntity task) => TaskDto(
      title: task.title,
      status: task.status,
      id: task.id,
      description: task.description,
      intervals: task.intervals,
      completedAt: task.completedAt);

  TaskEntity toEntity() => TaskEntity(
      title: title,
      status: status,
      intervals: intervals,
      id: id,
      description: description,
      completedAt: completedAt);
}
