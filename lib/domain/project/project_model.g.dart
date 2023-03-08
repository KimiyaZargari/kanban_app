// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      todo: json['To Do'] as int,
      done: json['Done'] as int,
      inProgress: json['In Progress'] as int,
    );

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'To Do': instance.todo,
      'Done': instance.done,
      'In Progress': instance.inProgress,
    };
