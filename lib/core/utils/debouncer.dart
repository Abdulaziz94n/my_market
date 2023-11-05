import 'dart:async';
import 'dart:ui';

class Debouncer {
  final Duration delay;
  VoidCallback action;
  Timer? _timer;

  Debouncer({required this.delay, required this.action});

  void call() {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
