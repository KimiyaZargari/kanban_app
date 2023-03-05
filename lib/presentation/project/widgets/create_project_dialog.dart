import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';

class CreateProjectDialog extends StatelessWidget {
  const CreateProjectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

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
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: AppTextField(
                label: 'Project Name:',
                controller: controller,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: Text('cancel'),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Consumer(builder: (context, ref, _) {
                  final notifier = ref.watch(projectsNotifierProvider.notifier);
                  return Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        notifier.createProject(controller.text.trim());
                        context.router.pop();
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
