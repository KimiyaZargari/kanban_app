// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDtoImpl _$$TaskDtoImplFromJson(Map<String, dynamic> json) =>
    _$TaskDtoImpl(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String?,
      status: json['status'] as String,
      intervals: (json['intervals'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$TaskDtoImplToJson(_$TaskDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'intervals': instance.intervals?.map((e) => e.toIso8601String()).toList(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };
