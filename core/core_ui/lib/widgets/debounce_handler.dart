import 'package:flutter/foundation.dart';
import 'dart:async';

class DebounceHandler {
  final Duration duration;
  Timer? _timer;

  DebounceHandler({required this.duration});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
