// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateProjectState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int projectId) created,
    required TResult Function() creating,
    required TResult Function() projectExists,
    required TResult Function(String message) networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int projectId)? created,
    TResult? Function()? creating,
    TResult? Function()? projectExists,
    TResult? Function(String message)? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int projectId)? created,
    TResult Function()? creating,
    TResult Function()? projectExists,
    TResult Function(String message)? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Created value) created,
    required TResult Function(_Creating value) creating,
    required TResult Function(_ProjectExists value) projectExists,
    required TResult Function(_NetworkError value) networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Created value)? created,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_ProjectExists value)? projectExists,
    TResult? Function(_NetworkError value)? networkError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Created value)? created,
    TResult Function(_Creating value)? creating,
    TResult Function(_ProjectExists value)? projectExists,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectStateCopyWith<$Res> {
  factory $CreateProjectStateCopyWith(
          CreateProjectState value, $Res Function(CreateProjectState) then) =
      _$CreateProjectStateCopyWithImpl<$Res, CreateProjectState>;
}

/// @nodoc
class _$CreateProjectStateCopyWithImpl<$Res, $Val extends CreateProjectState>
    implements $CreateProjectStateCopyWith<$Res> {
  _$CreateProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CreateProjectStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl();

  @override
  String toString() {
    return 'CreateProjectState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int projectId) created,
    required TResult Function() creating,
    required TResult Function() projectExists,
    required TResult Function(String message) networkError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int projectId)? created,
    TResult? Function()? creating,
    TResult? Function()? projectExists,
    TResult? Function(String message)? networkError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int projectId)? created,
    TResult Function()? creating,
    TResult Function()? projectExists,
    TResult Function(String message)? networkError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Created value) created,
    required TResult Function(_Creating value) creating,
    required TResult Function(_ProjectExists value) projectExists,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Created value)? created,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_ProjectExists value)? projectExists,
    TResult? Function(_NetworkError value)? networkError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Created value)? created,
    TResult Function(_Creating value)? creating,
    TResult Function(_ProjectExists value)? projectExists,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateProjectState {
  factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CreatedImplCopyWith<$Res> {
  factory _$$CreatedImplCopyWith(
          _$CreatedImpl value, $Res Function(_$CreatedImpl) then) =
      __$$CreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int projectId});
}

/// @nodoc
class __$$CreatedImplCopyWithImpl<$Res>
    extends _$CreateProjectStateCopyWithImpl<$Res, _$CreatedImpl>
    implements _$$CreatedImplCopyWith<$Res> {
  __$$CreatedImplCopyWithImpl(
      _$CreatedImpl _value, $Res Function(_$CreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$CreatedImpl(
      null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CreatedImpl implements _Created {
  _$CreatedImpl(this.projectId);

  @override
  final int projectId;

  @override
  String toString() {
    return 'CreateProjectState.created(projectId: $projectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedImplCopyWith<_$CreatedImpl> get copyWith =>
      __$$CreatedImplCopyWithImpl<_$CreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int projectId) created,
    required TResult Function() creating,
    required TResult Function() projectExists,
    required TResult Function(String message) networkError,
  }) {
    return created(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int projectId)? created,
    TResult? Function()? creating,
    TResult? Function()? projectExists,
    TResult? Function(String message)? networkError,
  }) {
    return created?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int projectId)? created,
    TResult Function()? creating,
    TResult Function()? projectExists,
    TResult Function(String message)? networkError,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Created value) created,
    required TResult Function(_Creating value) creating,
    required TResult Function(_ProjectExists value) projectExists,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Created value)? created,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_ProjectExists value)? projectExists,
    TResult? Function(_NetworkError value)? networkError,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Created value)? created,
    TResult Function(_Creating value)? creating,
    TResult Function(_ProjectExists value)? projectExists,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created implements CreateProjectState {
  factory _Created(final int projectId) = _$CreatedImpl;

  int get projectId;
  @JsonKey(ignore: true)
  _$$CreatedImplCopyWith<_$CreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatingImplCopyWith<$Res> {
  factory _$$CreatingImplCopyWith(
          _$CreatingImpl value, $Res Function(_$CreatingImpl) then) =
      __$$CreatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingImplCopyWithImpl<$Res>
    extends _$CreateProjectStateCopyWithImpl<$Res, _$CreatingImpl>
    implements _$$CreatingImplCopyWith<$Res> {
  __$$CreatingImplCopyWithImpl(
      _$CreatingImpl _value, $Res Function(_$CreatingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreatingImpl implements _Creating {
  _$CreatingImpl();

  @override
  String toString() {
    return 'CreateProjectState.creating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int projectId) created,
    required TResult Function() creating,
    required TResult Function() projectExists,
    required TResult Function(String message) networkError,
  }) {
    return creating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int projectId)? created,
    TResult? Function()? creating,
    TResult? Function()? projectExists,
    TResult? Function(String message)? networkError,
  }) {
    return creating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int projectId)? created,
    TResult Function()? creating,
    TResult Function()? projectExists,
    TResult Function(String message)? networkError,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Created value) created,
    required TResult Function(_Creating value) creating,
    required TResult Function(_ProjectExists value) projectExists,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Created value)? created,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_ProjectExists value)? projectExists,
    TResult? Function(_NetworkError value)? networkError,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Created value)? created,
    TResult Function(_Creating value)? creating,
    TResult Function(_ProjectExists value)? projectExists,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(this);
    }
    return orElse();
  }
}

abstract class _Creating implements CreateProjectState {
  factory _Creating() = _$CreatingImpl;
}

/// @nodoc
abstract class _$$ProjectExistsImplCopyWith<$Res> {
  factory _$$ProjectExistsImplCopyWith(
          _$ProjectExistsImpl value, $Res Function(_$ProjectExistsImpl) then) =
      __$$ProjectExistsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectExistsImplCopyWithImpl<$Res>
    extends _$CreateProjectStateCopyWithImpl<$Res, _$ProjectExistsImpl>
    implements _$$ProjectExistsImplCopyWith<$Res> {
  __$$ProjectExistsImplCopyWithImpl(
      _$ProjectExistsImpl _value, $Res Function(_$ProjectExistsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectExistsImpl implements _ProjectExists {
  _$ProjectExistsImpl();

  @override
  String toString() {
    return 'CreateProjectState.projectExists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProjectExistsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int projectId) created,
    required TResult Function() creating,
    required TResult Function() projectExists,
    required TResult Function(String message) networkError,
  }) {
    return projectExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int projectId)? created,
    TResult? Function()? creating,
    TResult? Function()? projectExists,
    TResult? Function(String message)? networkError,
  }) {
    return projectExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int projectId)? created,
    TResult Function()? creating,
    TResult Function()? projectExists,
    TResult Function(String message)? networkError,
    required TResult orElse(),
  }) {
    if (projectExists != null) {
      return projectExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Created value) created,
    required TResult Function(_Creating value) creating,
    required TResult Function(_ProjectExists value) projectExists,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return projectExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Created value)? created,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_ProjectExists value)? projectExists,
    TResult? Function(_NetworkError value)? networkError,
  }) {
    return projectExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Created value)? created,
    TResult Function(_Creating value)? creating,
    TResult Function(_ProjectExists value)? projectExists,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (projectExists != null) {
      return projectExists(this);
    }
    return orElse();
  }
}

abstract class _ProjectExists implements CreateProjectState {
  factory _ProjectExists() = _$ProjectExistsImpl;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$CreateProjectStateCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NetworkErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements _NetworkError {
  _$NetworkErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CreateProjectState.networkError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int projectId) created,
    required TResult Function() creating,
    required TResult Function() projectExists,
    required TResult Function(String message) networkError,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int projectId)? created,
    TResult? Function()? creating,
    TResult? Function()? projectExists,
    TResult? Function(String message)? networkError,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int projectId)? created,
    TResult Function()? creating,
    TResult Function()? projectExists,
    TResult Function(String message)? networkError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Created value) created,
    required TResult Function(_Creating value) creating,
    required TResult Function(_ProjectExists value) projectExists,
    required TResult Function(_NetworkError value) networkError,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Created value)? created,
    TResult? Function(_Creating value)? creating,
    TResult? Function(_ProjectExists value)? projectExists,
    TResult? Function(_NetworkError value)? networkError,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Created value)? created,
    TResult Function(_Creating value)? creating,
    TResult Function(_ProjectExists value)? projectExists,
    TResult Function(_NetworkError value)? networkError,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements CreateProjectState {
  factory _NetworkError(final String message) = _$NetworkErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
