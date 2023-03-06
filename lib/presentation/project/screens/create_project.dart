import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/widgets/loading_widget.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/project/notifiers/create_project.dart';

import '../../core/config/strings.dart';

class CreateProjectPage extends ConsumerWidget {
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(createProjectNotifierProvider.notifier);
    final state = ref.watch(createProjectNotifierProvider);
    ref.listen(createProjectNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          created: () {
            context.router.pop();
          });
    });

    return PageBase(
      title: AppStrings.createProject,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Form(
                    key: notifier.createProjectKey,
                    child: AppTextField(
                      label: 'Project Name:',
                      onSaved: (val) {
                        notifier.projectName = val!;
                      },
                      validator: (val) {
                        if (val?.trim().isEmpty ?? true) {
                          return 'Please enter the project name!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                state.maybeWhen(
                    orElse: () => Container(),
                    projectExists: () => Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'This project already exits!',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: const Text('cancel'),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Consumer(builder: (context, ref, _) {
                  return Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (notifier.createProjectKey.currentState
                                ?.validate() ??
                            false) {
                          notifier.createProjectKey.currentState!.save();
                          notifier.createProject();
                        }
                      },
                      child: state.maybeWhen(
                        creating: () => const LoadingWidget(),
                        orElse: () => const Text('create'),
                      ),
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
