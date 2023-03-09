import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../domain/core/enums.dart';

import '../../core/config/strings.dart';
import '../../core/widgets/text_field.dart';
import '../notifiers/create_edit_task.dart';

class SelectTaskStatus extends ConsumerWidget {
  final int projectId;
  final TextEditingController completedAtController;

  const SelectTaskStatus(
      {required this.projectId, required this.completedAtController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final taskStatus = ref.watch(selectedTaskStateNotifierProvider);
    final startTimer = ref.watch(startTimerNotifierProvider);
    final taskStatusNotifier =
        ref.watch(selectedTaskStateNotifierProvider.notifier);
    final startTimerNotifier = ref.watch(startTimerNotifierProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 8, left: 8),
          child: Text(
            'Status:',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        DropdownMenu<TaskStatus>(
            initialSelection: taskStatus,
            onSelected: (val) {
              if (val != null) taskStatusNotifier.state = val;
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(
                  leadingIcon: Icon(TaskStatus.toDo.getIcon()),
                  value: TaskStatus.toDo,
                  label: TaskStatus.toDo.toString()),
              DropdownMenuEntry(
                  leadingIcon: Icon(TaskStatus.inProgress.getIcon()),
                  value: TaskStatus.inProgress,
                  label: TaskStatus.inProgress.toString()),
              DropdownMenuEntry(
                  leadingIcon: Icon(TaskStatus.done.getIcon()),
                  value: TaskStatus.done,
                  label: TaskStatus.done.toString()),
            ]),
        if (taskStatus == TaskStatus.inProgress)
          Row(
            children: [
              Checkbox(
                  value: startTimer,
                  onChanged: (val) {
                    if (val != null) {
                      startTimerNotifier.state = val;
                    }
                  }),
              Text(
                'Start task timer',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        else if (taskStatus == TaskStatus.done)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AppTextField(
              readOnly: true,
              controller: completedAtController,
              validator: (val) {
                if (val?.trim().isEmpty ?? true) {
                  return 'Please enter task completion date';
                }
                return null;
              },
              label: AppStrings.completedAt,
              onTap: () async {
                final createTaskNotifier =
                    ref.read(createTaskNotifierProvider(projectId).notifier);
                final time = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime.now());
                if (time != null) {
                  createTaskNotifier.completedAt = time;
                  createTaskNotifier.completedAtController.text =
                      DateFormat('dd  MMM  yyyy').format(time).toString();
                }
              },
            ),
          )
      ],
    );
  }
}
