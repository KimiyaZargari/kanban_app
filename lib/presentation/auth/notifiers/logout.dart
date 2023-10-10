import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/application/auth/logout.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';
import 'package:kanban_app/infrastructure/auth/auth_repository.dart';

part 'logout.freezed.dart';

part 'logout_states.dart';

final logoutNotifierProvider =
    StateNotifierProvider.autoDispose<LogoutNotifier, LogoutState>(
        (ref) => LogoutNotifier(repository: ref.watch(authRepositoryProvider)));
final dragTaskNotifierProvider = StateProvider<bool>((ref) => false);

class LogoutNotifier extends StateNotifier<LogoutState> {
  IAuthRepository repository;

  LogoutNotifier({required this.repository}) : super(_Initial());

  logout() {
    state = _LoggingOut();
    Logout logout = Logout(repository);
    (logout(unit)).then((value) => state = _LoggedOut());
  }
}
