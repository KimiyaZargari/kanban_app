// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double turn) initial,
    required TResult Function() splashCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double turn)? initial,
    TResult? Function()? splashCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double turn)? initial,
    TResult Function()? splashCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SplashCompleted value) splashCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SplashCompleted value)? splashCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SplashCompleted value)? splashCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @useResult
  $Res call({double turn});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turn = null,
  }) {
    return _then(_$_Initial(
      null == turn
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  _$_Initial(this.turn);

  @override
  final double turn;

  @override
  String toString() {
    return 'SplashState.initial(turn: $turn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.turn, turn) || other.turn == turn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, turn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double turn) initial,
    required TResult Function() splashCompleted,
  }) {
    return initial(turn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double turn)? initial,
    TResult? Function()? splashCompleted,
  }) {
    return initial?.call(turn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double turn)? initial,
    TResult Function()? splashCompleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(turn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SplashCompleted value) splashCompleted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SplashCompleted value)? splashCompleted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SplashCompleted value)? splashCompleted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SplashState {
  factory _Initial(final double turn) = _$_Initial;

  double get turn;
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SplashCompletedCopyWith<$Res> {
  factory _$$_SplashCompletedCopyWith(
          _$_SplashCompleted value, $Res Function(_$_SplashCompleted) then) =
      __$$_SplashCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SplashCompletedCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_SplashCompleted>
    implements _$$_SplashCompletedCopyWith<$Res> {
  __$$_SplashCompletedCopyWithImpl(
      _$_SplashCompleted _value, $Res Function(_$_SplashCompleted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SplashCompleted implements _SplashCompleted {
  _$_SplashCompleted();

  @override
  String toString() {
    return 'SplashState.splashCompleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SplashCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double turn) initial,
    required TResult Function() splashCompleted,
  }) {
    return splashCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double turn)? initial,
    TResult? Function()? splashCompleted,
  }) {
    return splashCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double turn)? initial,
    TResult Function()? splashCompleted,
    required TResult orElse(),
  }) {
    if (splashCompleted != null) {
      return splashCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SplashCompleted value) splashCompleted,
  }) {
    return splashCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SplashCompleted value)? splashCompleted,
  }) {
    return splashCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SplashCompleted value)? splashCompleted,
    required TResult orElse(),
  }) {
    if (splashCompleted != null) {
      return splashCompleted(this);
    }
    return orElse();
  }
}

abstract class _SplashCompleted implements SplashState {
  factory _SplashCompleted() = _$_SplashCompleted;
}
