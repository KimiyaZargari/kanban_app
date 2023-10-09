part of 'login.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required bool showValidationMessages,
    required bool isSubmitting,
    required bool isNewUser,
    required Either<AuthFailure, Unit>? authFailureOrSuccessOption,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
      email: '',
      password: '',
      showValidationMessages: false,
      isSubmitting: false,
      isNewUser: false,
      authFailureOrSuccessOption: null);
//
// factory LoginState.authenticating() = _Authenticating;
// factory LoginState.authenticated() = _Authenticated;
//
//
// factory LoginState.networkError(AuthFailure authFailure) = _NetworkError;
}
