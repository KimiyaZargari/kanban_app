import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';

part 'board_state.dart';

final boardNotifierProvider =
    StateNotifierProvider<BoardNotifier, BoardState>((ref) => BoardNotifier());

class BoardNotifier extends StateNotifier<BoardState> {
  BoardNotifier() : super(_Initial());
  List<String> todo = [
        'test 1',
        'test 2',
        'test 3',
        'test 4',
        'this is a task with a long name',
        'this is a taaaaaask with a veryyyy  long name',
        'normal name'
      ],
      inProgress = [],
      done = [];
}
