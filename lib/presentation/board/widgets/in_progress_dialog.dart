import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InProgressDialog extends StatelessWidget {
  const InProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Would you like to start the timer on this task?'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                  child: const Text('Not yet!'),
                  onPressed: () {
                    context.router.pop(false);
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    context.router.pop(true);
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
