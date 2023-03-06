import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/project/notifiers/create_project.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';

class CreateProjectPage extends ConsumerWidget {
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(createProjectNotifierProvider.notifier);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Create New Project!',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
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
                          notifier.createProject();
                        }
                      },
                      child: const Text('create'),
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
