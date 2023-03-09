import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/board/widgets/done_dialog.dart';
import 'package:kanban_app/presentation/board/widgets/in_progress_dialog.dart';
import 'package:kanban_app/presentation/board/widgets/task_card.dart';
import 'package:kanban_app/presentation/board/widgets/to_do_dialog.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

import '../../core/widgets/loading_widget.dart';

class ProjectBoardPage extends ConsumerWidget {
  final String projectName;

  const ProjectBoardPage(
      {@pathParam required int id,
      @queryParam this.projectName = 'Board',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final projectId = context.router.stack
        .where((element) => element.name == ProjectBoardRoute.name)
        .first
        .routeData
        .pathParams
        .getInt('id');
    final state = ref.watch(boardNotifierProvider(projectId));
    final notifier = ref.watch(boardNotifierProvider(projectId).notifier);
    return PageBase(
        title: projectName,
        extraActionButton: IconButton(
          onPressed: () {
            final time =
                DateTime.now().toString().substring(0, 16).replaceAll(' ', '-');
            notifier.exportCsv("${projectName}_$time");

            // showDialog(context: context, builder: () =);
          },
          icon: const Icon(Icons.file_download_rounded),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(CreateTaskRoute(projectId: projectId));
          },
          child: const Icon(Icons.add_rounded),
        ),
        child: state.maybeWhen(
            initial: () {
              notifier.getData();
              return const LoadingWidget();
            },
            orElse: () => const LoadingWidget(),
            loaded: () => Column(
                  children: [
                    Expanded(
                        child: DragAndDropLists(
                      //  disableScrolling: true,
                      listWidth: MediaQuery.of(context).size.width /
                          notifier.tasks.length,
                      listDraggingWidth: 0,
                      listPadding: const EdgeInsets.all(0),
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      axis: Axis.horizontal,
                      onItemReorder: (int oldItemIndex, int oldListIndex,
                          int newItemIndex, int newListIndex) async {
                        if (newListIndex == 0) {
                          bool? takeBack;
                          if (newListIndex != oldListIndex) {
                            takeBack = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => const ToDoDialog()) ??
                                false;
                          }
                          if (takeBack ?? true)
                            await notifier.takeTaskToToDo(
                                task: notifier.tasks[notifier.tasks.keys
                                    .toList()[oldListIndex]]![oldItemIndex],
                                at: newItemIndex);
                        } else if (newListIndex == 1) {
                          bool shouldStartTimer = false;
                          if (newListIndex != oldListIndex) {
                            shouldStartTimer = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => const InProgressDialog()) ??
                                false;
                          }
                          await notifier.takeTaskToInProgress(
                              task: notifier.tasks[notifier.tasks.keys
                                  .toList()[oldListIndex]]![oldItemIndex],
                              shouldStartTimer: shouldStartTimer,
                              at: newItemIndex);
                        } else if (newListIndex == 2) {
                          DateTime? completion = DateTime.now();
                          setCompletion(DateTime val) {
                            completion = val;
                          }

                          bool? confirm;
                          if (oldListIndex != newListIndex) {
                            confirm = await showDialog<bool>(
                                context: context,
                                builder: (_) =>
                                    DoneDialog((val) => setCompletion(val)));
                          } else {
                            completion = null;
                          }
                          if (confirm ?? oldListIndex == newListIndex) {
                            await notifier.takeTaskToDone(
                                task: notifier.tasks[notifier.tasks.keys
                                    .toList()[oldListIndex]]![oldItemIndex],
                                completion: completion,
                                at: newItemIndex);
                          }
                        }
                        ref
                            .read(projectsNotifierProvider.notifier)
                            .getProjects();
                      },
                      onItemDraggingChanged: (_, dragging) {
                        ref.read(dragTaskNotifierProvider.notifier).state =
                            dragging;
                      },
                      onListReorder: (int oldListIndex, int newListIndex) {},
                      children: notifier.tasks
                          .map((column, tasks) => MapEntry(
                              column,
                              DragAndDropList(
                                header: Container(
                                    color: Theme.of(context).cardColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    alignment: Alignment.center,
                                    child: Text(column,
                                        textAlign: TextAlign.center)),
                                canDrag: false,
                                contentsWhenEmpty: Container(),
                                lastTarget:
                                    Consumer(builder: (context, ref, _) {
                                  final dragging =
                                      ref.watch(dragTaskNotifierProvider);
                                  return Visibility(
                                    visible: dragging,
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      dashPattern: [8, 8],
                                      radius: Radius.circular(16),
                                      color: Theme.of(context).dividerColor,
                                      borderPadding: EdgeInsets.all(2),
                                      padding: EdgeInsets.all(4),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height -
                                                200,
                                      ),
                                    ),
                                  );
                                }),
                                children: tasks
                                    .map((task) => DragAndDropItem(
                                        feedbackWidget: Container(
                                          constraints: BoxConstraints(
                                            minHeight: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3) /
                                                1.2,
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Card(
                                            color:
                                                Theme.of(context).primaryColor,
                                            elevation: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                task.title,
                                                textAlign: TextAlign.justify,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                                softWrap: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: TaskCard(
                                          task,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              notifier.tasks.length,
                                          logTime: () =>
                                              notifier.logTaskTime(task: task),
                                          onDelete: () =>
                                              notifier.deleteTask(task),
                                        )))
                                    .toList(),
                              )))
                          .values
                          .toList(),
                    )),
                  ],
                )));
  }
}
