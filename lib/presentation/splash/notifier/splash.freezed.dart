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
    required TResult Function() userSignedIn,
    required TResult Function() userSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double turn)? initial,
    TResult? Function()? userSignedIn,
    TResult? Function()? userSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double turn)? initial,
    TResult Function()? userSignedIn,
    TResult Function()? userSignedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UserSignedIn value) userSignedIn,
    required TResult Function(_UserSignedOut value) userSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserSignedIn value)? userSignedIn,
    TResult? Function(_UserSignedOut value)? userSignedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserSignedIn value)? userSignedIn,
    TResult Function(_UserSignedOut value)? userSignedOut,
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
    required TResult Function() userSignedIn,
    required TResult Function() userSignedOut,
  }) {
    return initial(turn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double turn)? initial,
    TResult? Function()? userSignedIn,
    TResult? Function()? userSignedOut,
  }) {
    return initial?.call(turn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double turn)? initial,
    TResult Function()? userSignedIn,
    TResult Function()? userSignedOut,
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
    required TResult Function(_UserSignedIn value) userSignedIn,
    required TResult Function(_UserSignedOut value) userSignedOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserSignedIn value)? userSignedIn,
    TResult? Function(_UserSignedOut value)? userSignedOut,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserSignedIn value)? userSignedIn,
    TResult Function(_UserSignedOut value)? userSignedOut,
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
abstract class _$$_UserSignedInCopyWith<$Res> {
  factory _$$_UserSignedInCopyWith(
          _$_UserSignedIn value, $Res Function(_$_UserSignedIn) then) =
      __$$_UserSignedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserSignedInCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_UserSignedIn>
    implements _$$_UserSignedInCopyWith<$Res> {
  __$$_UserSignedInCopyWithImpl(
      _$_UserSignedIn _value, $Res Function(_$_UserSignedIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserSignedIn implements _UserSignedIn {
  _$_UserSignedIn();

  @override
  String toString() {
    return 'SplashState.userSignedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserSignedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double turn) initial,
    required TResult Function() userSignedIn,
    required TResult Function() userSignedOut,
  }) {
    return userSignedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double turn)? initial,
    TResult? Function()? userSignedIn,
    TResult? Function()? userSignedOut,
  }) {
    return userSignedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double turn)? initial,
    TResult Function()? userSignedIn,
    TResult Function()? userSignedOut,
    required TResult orElse(),
  }) {
    if (userSignedIn != null) {
      return userSignedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UserSignedIn value) userSignedIn,
    required TResult Function(_UserSignedOut value) userSignedOut,
  }) {
    return userSignedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserSignedIn value)? userSignedIn,
    TResult? Function(_UserSignedOut value)? userSignedOut,
  }) {
    return userSignedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserSignedIn value)? userSignedIn,
    TResult Function(_UserSignedOut value)? userSignedOut,
    required TResult orElse(),
  }) {
    if (userSignedIn != null) {
      return userSignedIn(this);
    }
    return orElse();
  }
}

abstract class _UserSignedIn implements SplashState {
  factory _UserSignedIn() = _$_UserSignedIn;
}

/// @nodoc
abstract class _$$_UserSignedOutCopyWith<$Res> {
  factory _$$_UserSignedOutCopyWith(
          _$_UserSignedOut value, $Res Function(_$_UserSignedOut) then) =
      __$$_UserSignedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UserSignedOutCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$_UserSignedOut>
    implements _$$_UserSignedOutCopyWith<$Res> {
  __$$_UserSignedOutCopyWithImpl(
      _$_UserSignedOut _value, $Res Function(_$_UserSignedOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UserSignedOut implements _UserSignedOut {
  _$_UserSignedOut();

  @override
  String toString() {
    return 'SplashState.userSignedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UserSignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double turn) initial,
    required TResult Function() userSignedIn,
    required TResult Function() userSignedOut,
  }) {
    return userSignedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double turn)? initial,
    TResult? Function()? userSignedIn,
    TResult? Function()? userSignedOut,
  }) {
    return userSignedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double turn)? initial,
    TResult Function()? userSignedIn,
    TResult Function()? userSignedOut,
    required TResult orElse(),
  }) {
    if (userSignedOut != null) {
      return userSignedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UserSignedIn value) userSignedIn,
    required TResult Function(_UserSignedOut value) userSignedOut,
  }) {
    return userSignedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_UserSignedIn value)? userSignedIn,
    TResult? Function(_UserSignedOut value)? userSignedOut,
  }) {
    return userSignedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UserSignedIn value)? userSignedIn,
    TResult Function(_UserSignedOut value)? userSignedOut,
    required TResult orElse(),
  }) {
    if (userSignedOut != null) {
      return userSignedOut(this);
    }
    return orElse();
  }
}

abstract class _UserSignedOut implements SplashState {
  factory _UserSignedOut() = _$_UserSignedOut;
}
