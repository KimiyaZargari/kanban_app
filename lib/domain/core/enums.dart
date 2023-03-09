import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TaskStatus {
  toDo,
  inProgress,
  done;

  @override
  String toString() {
    switch (this) {
      case TaskStatus.toDo:
        return 'To Do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
    }
  }

  IconData getIcon() {
    switch (this) {
      case TaskStatus.toDo:
        return Icons.list_alt_rounded;
      case TaskStatus.inProgress:
        return Icons.timelapse_rounded;
      case TaskStatus.done:
        return Icons.done_rounded;
    }
  }
}
final taskValues = EnumValues({
  TaskStatus.toDo.toString(): TaskStatus.toDo,
  TaskStatus.inProgress.toString(): TaskStatus.inProgress,
  TaskStatus.done.toString(): TaskStatus.done,

});
class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}