import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/auth/notifiers/login.dart';
import 'package:kanban_app/presentation/core/widgets/loading_widget.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

import '../../core/config/strings.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginNotifierProvider.notifier);
    final state = ref.watch(loginNotifierProvider);
    ref.listen(loginNotifierProvider, (previous, next) {
      if (previous?.authFailureOrSuccessOption == null &&
          (next.authFailureOrSuccessOption?.isRight() ?? false)) {
        context.router.push(const ProjectsRoute());
      }
    });
    return PageBase(
        title: 'Login',
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                  autovalidateMode: state.showValidationMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  key: notifier.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppTextField(
                        label: 'Email Address',
                        onChanged: (val) => notifier.onEmailChanged(val),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter your email address!';
                          }
                          const emailRegex =
                              r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
                          if (!RegExp(emailRegex).hasMatch(val)) {
                            return AppStrings.invalidEmailError;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      AppTextField(
                        label: 'Password',
                        onChanged: (val) => notifier.onPasswordChanged(val),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter your password!';
                          } else if (val.length < 8) {
                            return AppStrings.invalidPasswordError;
                          }
                          return null;
                        },
                      ),
                      if (state.authFailureOrSuccessOption != null)
                        state.authFailureOrSuccessOption!.fold(
                            (l) => Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    10, 20, 10,0),
                                  child: Text(
                                    l.message,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error),
                                  ),
                                ),
                            (r) => Container()),
                    ],
                  )),
              ElevatedButton(
                onPressed: () {
                  if (notifier.formKey.currentState!.validate()) {
                    notifier.registerWithEmailAndPassword();
                  } else if (state.showValidationMessages == false) {
                    notifier.turnOnAutoValidation();
                  }
                },
                child: state.isSubmitting
                    ? const LoadingWidget()
                    : const Text('Create Account'),
              )
            ],
          ),
        ));
  }
}
