import 'package:flutter/material.dart';

class DeleteProjectDialog extends StatelessWidget {
  const DeleteProjectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Delete Project?",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16),
              child: Text(
                'Are you  sure you want to delete this project and all it\'s data?',
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child:
                        OutlinedButton(onPressed: () {}, child: Text("Yes!"))),
                Expanded(
                    child:
                        FilledButton(onPressed: () {}, child: Text('cancel')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
