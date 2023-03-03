import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/core/widgets/text_field.dart';

class CreateProjectDialog extends StatelessWidget {
  const CreateProjectDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: AppTextField(
                label: 'Project Name:',
              ),
            ),
            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},

                    child: Text('cancel'),
                  ),
                ),
                SizedBox(width: 7,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('create'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
