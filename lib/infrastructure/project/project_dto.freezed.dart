// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) {
  return _ProjectDto.fromJson(json);
}

/// @nodoc
mixin _$ProjectDto {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'To Do')
  int get todo => throw _privateConstructorUsedError;
  @JsonKey(name: 'Done')
  int get done => throw _privateConstructorUsedError;
  @JsonKey(name: 'In Progress')
  int get inProgress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectDtoCopyWith<ProjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectDtoCopyWith<$Res> {
  factory $ProjectDtoCopyWith(
          ProjectDto value, $Res Function(ProjectDto) then) =
      _$ProjectDtoCopyWithImpl<$Res, ProjectDto>;
  @useResult
  $Res call(
      {int? id,
      String name,
      @JsonKey(name: 'To Do') int todo,
      @JsonKey(name: 'Done') int done,
      @JsonKey(name: 'In Progress') int inProgress});
}

/// @nodoc
class _$ProjectDtoCopyWithImpl<$Res, $Val extends ProjectDto>
    implements $ProjectDtoCopyWith<$Res> {
  _$ProjectDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? todo = null,
    Object? done = null,
    Object? inProgress = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as int,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectDtoImplCopyWith<$Res>
    implements $ProjectDtoCopyWith<$Res> {
  factory _$$ProjectDtoImplCopyWith(
          _$ProjectDtoImpl value, $Res Function(_$ProjectDtoImpl) then) =
      __$$ProjectDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @JsonKey(name: 'To Do') int todo,
      @JsonKey(name: 'Done') int done,
      @JsonKey(name: 'In Progress') int inProgress});
}

/// @nodoc
class __$$ProjectDtoImplCopyWithImpl<$Res>
    extends _$ProjectDtoCopyWithImpl<$Res, _$ProjectDtoImpl>
    implements _$$ProjectDtoImplCopyWith<$Res> {
  __$$ProjectDtoImplCopyWithImpl(
      _$ProjectDtoImpl _value, $Res Function(_$ProjectDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? todo = null,
    Object? done = null,
    Object? inProgress = null,
  }) {
    return _then(_$ProjectDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as int,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectDtoImpl extends _ProjectDto {
  _$ProjectDtoImpl(
      {this.id,
      required this.name,
      @JsonKey(name: 'To Do') required this.todo,
      @JsonKey(name: 'Done') required this.done,
      @JsonKey(name: 'In Progress') required this.inProgress})
      : super._();

  factory _$ProjectDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  @JsonKey(name: 'To Do')
  final int todo;
  @override
  @JsonKey(name: 'Done')
  final int done;
  @override
  @JsonKey(name: 'In Progress')
  final int inProgress;

  @override
  String toString() {
    return 'ProjectDto(id: $id, name: $name, todo: $todo, done: $done, inProgress: $inProgress)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectDtoImplCopyWith<_$ProjectDtoImpl> get copyWith =>
      __$$ProjectDtoImplCopyWithImpl<_$ProjectDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectDtoImplToJson(
      this,
    );
  }
}

abstract class _ProjectDto extends ProjectDto {
  factory _ProjectDto(
          {final int? id,
          required final String name,
          @JsonKey(name: 'To Do') required final int todo,
          @JsonKey(name: 'Done') required final int done,
          @JsonKey(name: 'In Progress') required final int inProgress}) =
      _$ProjectDtoImpl;
  _ProjectDto._() : super._();

  factory _ProjectDto.fromJson(Map<String, dynamic> json) =
      _$ProjectDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'To Do')
  int get todo;
  @override
  @JsonKey(name: 'Done')
  int get done;
  @override
  @JsonKey(name: 'In Progress')
  int get inProgress;
  @override
  @JsonKey(ignore: true)
  _$$ProjectDtoImplCopyWith<_$ProjectDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
