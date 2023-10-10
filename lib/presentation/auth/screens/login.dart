import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban_app/presentation/auth/notifiers/login.dart';
import 'package:kanban_app/presentation/core/config/vectors.dart';
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
        context.router.replace(const ProjectsRoute());
      }
    });
    return PageBase(
        title: state.isNewUser ? 'Create Account' : 'Login',
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
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
                        (l) => l.maybeMap(
                            cancelledByUser: (_) => Container(),
                            serverError: (_) => Container(),
                            orElse: () => Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 20, 6, 0),
                                  child: Text(
                                    l.message,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error),
                                  ),
                                )),
                        (r) => Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (!state.isSubmitting && !state.waitingForGoogle) {
                          if (notifier.formKey.currentState!.validate()) {
                            if (state.isNewUser) {
                              notifier.registerWithEmailAndPassword();
                            } else {
                              notifier.signInWithEmailAndPassword();
                            }
                          } else if (state.showValidationMessages == false) {
                            notifier.turnOnAutoValidation();
                          }
                        }
                      },
                      child: state.isSubmitting
                          ? LoadingWidget(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            )
                          : Text(state.isNewUser ? 'Create Account' : 'Login'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.isNewUser
                          ? 'Already have an account?'
                          : 'Don\'t have an account?'),
                      TextButton(
                          onPressed:
                              !state.isSubmitting && !state.waitingForGoogle
                                  ? () {
                                      notifier.switchLoginType();
                                    }
                                  : null,
                          child: Text(state.isNewUser ? 'Login' : 'Register'))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Row(
                      children: [
                        Expanded(child: Divider(thickness: 2)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        Expanded(child: Divider(thickness: 2))
                      ],
                    ),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).cardColor,
                        foregroundColor:
                            Theme.of(context).textTheme.bodyMedium!.color,
                        elevation: 6),
                    onPressed: () {
                      if (!state.isSubmitting && !state.waitingForGoogle) {
                        notifier.googleLogin();
                      }
                    },
                    child: state.waitingForGoogle
                        ? const LoadingWidget()
                        : Row(
                            children: [
                              SvgPicture.asset(
                                AppVectors.google,
                                height: 20,
                              ),
                              const Expanded(
                                  child: Text(
                                'Login with with Google',
                                textAlign: TextAlign.center,
                              ))
                            ],
                          ),
                  ),
                ],
              )),
        ));
  }
}
