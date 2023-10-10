import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';
import 'package:kanban_app/infrastructure/auth/auth_repository.dart';

part 'splash.freezed.dart';

part 'splash_state.dart';

final splashNotifierProvider =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState>(
        (ref) => SplashNotifier(ref.watch(authRepositoryProvider)));

class SplashNotifier extends StateNotifier<SplashState> {
  IAuthRepository repository;

  SplashNotifier(this.repository) : super(_Initial(0)) {
    _turn();
  }

  _turn() {
    if (state is _Initial) {
      state = _Initial((state as _Initial).turn + 1 / 8);
      Future.delayed(const Duration(milliseconds: 300))
          .then((value) => _turn());
    }
  }
}
