import 'package:auto_route/auto_route.dart';
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
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 16),
              child: Text(
                'Are you  sure you want to delete this project and all it\'s data?',
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          context.router.pop(true);
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.copyWith(
                                elevation: const MaterialStatePropertyAll(0),
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.error)),
                        child: Text("Yes!"))),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          context.router.pop(false);
                        },
                        child: Text('cancel')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
