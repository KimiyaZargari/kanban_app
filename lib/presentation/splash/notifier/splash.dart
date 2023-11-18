import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/infrastructure/project/project_repository.dart';

import '../../../infrastructure/core/local_database.dart';

part 'splash.freezed.dart';
part 'splash_state.dart';

final splashNotifierProvider =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState>(
        (ref) => SplashNotifier());

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(_Initial(0));

  openBox() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _turn();
    await Future.delayed(const Duration(seconds: 4));

    state = _SplashCompleted();
  }

  _turn() {
    if (state is _Initial) {
      state = _Initial((state as _Initial).turn + 1 / 8);
      Future.delayed(const Duration(milliseconds: 300))
          .then((value) => _turn());
    }
  }
}
