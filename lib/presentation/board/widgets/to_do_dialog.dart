import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoDialog extends StatelessWidget {
  const ToDoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Take Task Back?",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 16),
              child: Text(
                'Are you sure you want to move this task to \'To Do\'? You will lose all your progress!',
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                  child: const Text('Yes!'),
                  onPressed: () {
                    context.router.pop(true);
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    context.router.pop(false);
                  },
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
