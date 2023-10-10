part of 'login.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required bool showValidationMessages,
    required bool isSubmitting,
    required bool waitingForGoogle,
    required bool isNewUser,
    required Either<AuthFailure, Unit>? authFailureOrSuccessOption,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
      email: '',
      password: '',
      showValidationMessages: false,
      isSubmitting: false,
      waitingForGoogle: false,
      isNewUser: false,
      authFailureOrSuccessOption: null);
}
