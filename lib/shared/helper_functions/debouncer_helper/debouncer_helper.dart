import 'dart:async';
import 'dart:ui';

/// ⚠️ IMPORTANT:
/// Always call `dispose()` when this Debouncer is used in a `StatefulWidget`
/// or any long-lived object. Otherwise, it may hold memory longer than needed
/// or trigger callbacks after widget disposal, leading to **memory leaks** or
/// **unexpected behavior**.

/// A reusable Debouncer utility to prevent rapid-fire execution
/// of UI actions like button taps, searches, async tasks, etc.
class DebouncerHelper {
  final int milliseconds;
  Timer? _timer;

  DebouncerHelper({required this.milliseconds});

  /// Run a callback after the specified debounce delay.
  /// If called again within the duration, the previous callback is cancelled.
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  /// Run an async callback safely with debounce.
  /// Useful for awaiting functions like image pickers, API calls, etc.
  Future<void> runAsync(Future<void> Function() action) async {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      await action();
    });
  }

  /// Cancel the current timer if it's active.
  void cancel() {
    _timer?.cancel();
  }

  /// Dispose the debouncer to release resources and avoid memory leaks.
  void dispose() {
    cancel();
  }
}
