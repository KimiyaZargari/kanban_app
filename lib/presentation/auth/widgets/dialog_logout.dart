import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/config/strings.dart';
import 'package:kanban_app/presentation/core/widgets/loading_widget.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

import '../notifiers/logout.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Logout",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 16),
              child: Text(
                'Are you sure you want to logout?',
                textAlign: TextAlign.justify,
              ),
            ),
            Consumer(builder: (context, ref, _) {
              final state = ref.watch(logoutNotifierProvider);
              final notifier = ref.watch(logoutNotifierProvider.notifier);
              ref.listen(logoutNotifierProvider, (previous, next) {
                next.mapOrNull(loggedOut: (_) {
                  context.router.popUntilRoot();
                  context.router.replace(const LoginRoute());
                });
              });
              return Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            notifier.logout();
                          },
                          child: state.maybeWhen(
                              orElse: () => const Text('Yes!'),
                              loggingOut: () => const LoadingWidget()))),

                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: state.maybeWhen(
                            orElse: () => null,
                            initial: () => () {
                              context.router.pop();
                            },
                          ),
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.copyWith(
                              elevation: const MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.error)),
                          child: const Text(AppStrings.cancel)))

                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
