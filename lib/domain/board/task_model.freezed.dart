// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<DateTime>? get intervals => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String? description,
      String status,
      List<DateTime>? intervals,
      DateTime? completedAt});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? status = null,
    Object? intervals = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      intervals: freezed == intervals
          ? _value.intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$$_TaskModelCopyWith(
          _$_TaskModel value, $Res Function(_$_TaskModel) then) =
      __$$_TaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String? description,
      String status,
      List<DateTime>? intervals,
      DateTime? completedAt});
}

/// @nodoc
class __$$_TaskModelCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$_TaskModel>
    implements _$$_TaskModelCopyWith<$Res> {
  __$$_TaskModelCopyWithImpl(
      _$_TaskModel _value, $Res Function(_$_TaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? status = null,
    Object? intervals = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$_TaskModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      intervals: freezed == intervals
          ? _value._intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskModel extends _TaskModel {
  _$_TaskModel(
      {this.id,
      required this.title,
      this.description,
      required this.status,
      final List<DateTime>? intervals,
      this.completedAt})
      : _intervals = intervals,
        super._();

  factory _$_TaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskModelFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String status;
  final List<DateTime>? _intervals;
  @override
  List<DateTime>? get intervals {
    final value = _intervals;
    if (value == null) return null;
    if (_intervals is EqualUnmodifiableListView) return _intervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, status: $status, intervals: $intervals, completedAt: $completedAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      __$$_TaskModelCopyWithImpl<_$_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskModelToJson(
      this,
    );
  }
}

abstract class _TaskModel extends TaskModel {
  factory _TaskModel(
      {final int? id,
      required final String title,
      final String? description,
      required final String status,
      final List<DateTime>? intervals,
      final DateTime? completedAt}) = _$_TaskModel;
  _TaskModel._() : super._();

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$_TaskModel.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get status;
  @override
  List<DateTime>? get intervals;
  @override
  DateTime? get completedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditTaskModel {
  TaskModel get oldTask => throw _privateConstructorUsedError;
  TaskModel get newTask => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTaskModelCopyWith<EditTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTaskModelCopyWith<$Res> {
  factory $EditTaskModelCopyWith(
          EditTaskModel value, $Res Function(EditTaskModel) then) =
      _$EditTaskModelCopyWithImpl<$Res, EditTaskModel>;
  @useResult
  $Res call({TaskModel oldTask, TaskModel newTask});

  $TaskModelCopyWith<$Res> get oldTask;
  $TaskModelCopyWith<$Res> get newTask;
}

/// @nodoc
class _$EditTaskModelCopyWithImpl<$Res, $Val extends EditTaskModel>
    implements $EditTaskModelCopyWith<$Res> {
  _$EditTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldTask = null,
    Object? newTask = null,
  }) {
    return _then(_value.copyWith(
      oldTask: null == oldTask
          ? _value.oldTask
          : oldTask // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      newTask: null == newTask
          ? _value.newTask
          : newTask // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get oldTask {
    return $TaskModelCopyWith<$Res>(_value.oldTask, (value) {
      return _then(_value.copyWith(oldTask: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get newTask {
    return $TaskModelCopyWith<$Res>(_value.newTask, (value) {
      return _then(_value.copyWith(newTask: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EditTaskModelCopyWith<$Res>
    implements $EditTaskModelCopyWith<$Res> {
  factory _$$_EditTaskModelCopyWith(
          _$_EditTaskModel value, $Res Function(_$_EditTaskModel) then) =
      __$$_EditTaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TaskModel oldTask, TaskModel newTask});

  @override
  $TaskModelCopyWith<$Res> get oldTask;
  @override
  $TaskModelCopyWith<$Res> get newTask;
}

/// @nodoc
class __$$_EditTaskModelCopyWithImpl<$Res>
    extends _$EditTaskModelCopyWithImpl<$Res, _$_EditTaskModel>
    implements _$$_EditTaskModelCopyWith<$Res> {
  __$$_EditTaskModelCopyWithImpl(
      _$_EditTaskModel _value, $Res Function(_$_EditTaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldTask = null,
    Object? newTask = null,
  }) {
    return _then(_$_EditTaskModel(
      oldTask: null == oldTask
          ? _value.oldTask
          : oldTask // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      newTask: null == newTask
          ? _value.newTask
          : newTask // ignore: cast_nullable_to_non_nullable
              as TaskModel,
    ));
  }
}

/// @nodoc

class _$_EditTaskModel extends _EditTaskModel {
  _$_EditTaskModel({required this.oldTask, required this.newTask}) : super._();

  @override
  final TaskModel oldTask;
  @override
  final TaskModel newTask;

  @override
  String toString() {
    return 'EditTaskModel(oldTask: $oldTask, newTask: $newTask)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditTaskModel &&
            (identical(other.oldTask, oldTask) || other.oldTask == oldTask) &&
            (identical(other.newTask, newTask) || other.newTask == newTask));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldTask, newTask);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditTaskModelCopyWith<_$_EditTaskModel> get copyWith =>
      __$$_EditTaskModelCopyWithImpl<_$_EditTaskModel>(this, _$identity);
}

abstract class _EditTaskModel extends EditTaskModel {
  factory _EditTaskModel(
      {required final TaskModel oldTask,
      required final TaskModel newTask}) = _$_EditTaskModel;
  _EditTaskModel._() : super._();

  @override
  TaskModel get oldTask;
  @override
  TaskModel get newTask;
  @override
  @JsonKey(ignore: true)
  _$$_EditTaskModelCopyWith<_$_EditTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
