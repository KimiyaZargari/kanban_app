import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const AuthFailure._();

  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  const factory AuthFailure.serverError() = ServerError;

  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  const factory AuthFailure.invalidEmailAndPasswordCombination() =
  InvalidEmailAndPasswordCombination;

  String get message =>
    map(cancelledByUser: (_) => 'Operation has been canceled!',
        serverError: (_) => 'An unexpected error occurred! Please try again.',
        emailAlreadyInUse: (
            _) => 'An account with this email address already exists!',
        invalidEmailAndPasswordCombination: (
            _) => 'Incorrect email and password combination!');

}