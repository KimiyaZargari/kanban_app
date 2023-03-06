import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final dragTaskNotifierProvider =
    StateNotifierProvider<DragTaskNotifier, bool>((ref) => DragTaskNotifier());

class DragTaskNotifier extends StateNotifier<bool> {
  DragTaskNotifier() : super(false);
  String? itemDraggedFrom;

  startDragging(String from) {
    itemDraggedFrom = from;
    state = true;
  }

  endDragging() {
    itemDraggedFrom = null;
    state = false;
  }
}
