import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final timerProvider = ChangeNotifierProvider.autoDispose
    .family<TimerNotifier, int>((ref, id) => TimerNotifier(id));

class TimerNotifier extends ChangeNotifier {
  final int id;

  TimerNotifier(this.id);

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      notifyListeners();
    });
  }

  void cancelTimer() {
    timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
