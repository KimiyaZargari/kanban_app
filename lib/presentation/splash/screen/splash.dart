import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/config/colors.dart';
import 'package:lottie/lottie.dart';

import '../notifier/splash.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(splashNotifierProvider.notifier);
    final state = ref.watch(splashNotifierProvider);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Lottie.asset('assets/animation_lnjd0jn7.json'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              child: AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns:
                    state.maybeWhen(orElse: () => 0, initial: (turns) => turns),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            SizedBox(
              height: 80,
              child: Image.asset('assets/logo_text.png'),
            ),
          ],
        ),
      ],
    ));
  }
}
