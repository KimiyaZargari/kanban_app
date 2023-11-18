// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectDtoImpl _$$ProjectDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProjectDtoImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      todo: json['To Do'] as int,
      done: json['Done'] as int,
      inProgress: json['In Progress'] as int,
    );

Map<String, dynamic> _$$ProjectDtoImplToJson(_$ProjectDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'To Do': instance.todo,
      'Done': instance.done,
      'In Progress': instance.inProgress,
    };
