import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension RefX on AutoDisposeRef {
  void cacheFor(int seconds) {
    final link = keepAlive();
    final timer = Timer(Duration(seconds: seconds), () => link.close());
    onDispose(() => timer.cancel());
  }
}
