// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      status: json['status'] as String,
      intervals: (json['intervals'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      completedAt: json['completedAt'] as String,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'intervals': instance.intervals.map((e) => e.toIso8601String()).toList(),
      'completedAt': instance.completedAt,
    };
