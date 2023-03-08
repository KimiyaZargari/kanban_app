import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';

class DoneDialog extends StatelessWidget {
  final Function(DateTime) setCompletion;

  const DoneDialog(this.setCompletion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
        text: DateFormat('dd  MMM  yyyy').format(DateTime.now()).toString());
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Enter completion date:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextField(
              readOnly: true,
              controller: controller,
              onTap: () async {
                final time = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime.now());
                if (time != null) {
                  controller.text =
                      DateFormat('dd  MMM  yyyy').format(time).toString();
                  setCompletion(time);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                  child: const Text('cancel'),
                  onPressed: () {
                    context.router.pop(false);
                  },
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                  child: const Text('Done'),
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
