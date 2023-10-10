import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/application/auth/google_login.dart';
import 'package:kanban_app/domain/auth/auth_failure.dart';
import 'package:kanban_app/domain/auth/credentials.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';
import 'package:kanban_app/infrastructure/auth/auth_repository.dart';

import '../../../application/auth/register_user.dart';
import '../../../application/auth/sign_in.dart';

part 'login.freezed.dart';

part 'login_states.dart';

final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
        (ref) => LoginNotifier(repository: ref.watch(authRepositoryProvider)));
final dragTaskNotifierProvider = StateProvider<bool>((ref) => false);

class LoginNotifier extends StateNotifier<LoginState> {
  IAuthRepository repository;

  final formKey = GlobalKey<FormState>();

  LoginNotifier({required this.repository}) : super(LoginState.initial());

  onEmailChanged(String email) {
    state = state.copyWith(email: email, authFailureOrSuccessOption: null);
  }

  onPasswordChanged(String password) {
    state =
        state.copyWith(password: password, authFailureOrSuccessOption: null);
  }

  registerWithEmailAndPassword() async {
    RegisterUser registerUser = RegisterUser(repository);
    state =
        state.copyWith(isSubmitting: true, authFailureOrSuccessOption: null);

    Either<AuthFailure, Unit> failureOrSuccess = await registerUser(
        Credentials(email: state.email, password: state.password));
    state = state.copyWith(
        authFailureOrSuccessOption: failureOrSuccess, isSubmitting: false);
  }

  signInWithEmailAndPassword() async {
    SignIn signIn = SignIn(repository);
    state =
        state.copyWith(isSubmitting: true, authFailureOrSuccessOption: null);
    Either<AuthFailure, Unit> failureOrSuccess =
        await signIn(Credentials(email: state.email, password: state.password));
    state = state.copyWith(
        authFailureOrSuccessOption: failureOrSuccess, isSubmitting: false);
  }

  googleLogin() async {
    GoogleLogin googleLogin = GoogleLogin(repository);
    state =
        state.copyWith(waitingForGoogle: true, authFailureOrSuccessOption: null);
    Either<AuthFailure, Unit> failureOrSuccess =
        await googleLogin(unit);
    state = state.copyWith(
        authFailureOrSuccessOption: failureOrSuccess, waitingForGoogle: false);
  }

  turnOnAutoValidation() =>
      state = state.copyWith(showValidationMessages: true, isSubmitting: false);

  switchLoginType() => state = state.copyWith(isNewUser: !state.isNewUser);
}
