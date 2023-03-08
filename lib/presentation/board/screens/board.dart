import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/board/widgets/task_card.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

import '../../core/widgets/loading_widget.dart';

class ProjectBoardPage extends ConsumerWidget {
  const ProjectBoardPage({@pathParam required int id, Key? key})
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
        title: 'Board',
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
                          int newItemIndex, int newListIndex) {
                        notifier.changeTaskStatus(
                            task: notifier.tasks[notifier.tasks.keys
                                .toList()[oldListIndex]]![oldItemIndex],
                            from: notifier.tasks.keys.toList()[oldListIndex],
                            to: notifier.tasks.keys.toList()[newListIndex],
                            at: newItemIndex);
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
                                        feedbackWidget: TaskCard(
                                          task,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              notifier.tasks.length,
                                          isFeedback: true,
                                        ),
                                        child: TaskCard(
                                          task,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              notifier.tasks.length,
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
