import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';

part 'board_state.dart';

final boardNotifierProvider =
    StateNotifierProvider.autoDispose<BoardNotifier, BoardState>(
        (ref) => BoardNotifier());
final dragTaskNotifierProvider = StateProvider<bool>((ref) => false);

class BoardNotifier extends StateNotifier<BoardState> {
  BoardNotifier() : super(_Initial());
  Map<String, List<String>> tasks = {
    'To Do': [
      'test 1',
      'test 2',
      'test 3',
      'test 4',
      'this is a task with a long name',
      'this is a taaaaaask with a veryyyy  long name',
      'normal name'
    ],
    'In Progress': [],
    'Done': [],
    'QA Passed': []
  };
  init(){

  }

  moveTask(
      {required String task,
      required String from,
      required String to,
      int? at}) {
    tasks[from]?.remove(task);
    if (at == null || at > tasks[to]!.length) {
      tasks[to]?.add(task);
    } else {
      tasks[to]?.insert(at, task);
    }
    state = _Loaded();
  }
}
