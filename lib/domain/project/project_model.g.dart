// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      todo: json['todo'] as int,
      inProgress: json['inProgress'] as int,
      done: json['done'] as int,
    );

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'todo': instance.todo,
      'inProgress': instance.inProgress,
      'done': instance.done,
    };
