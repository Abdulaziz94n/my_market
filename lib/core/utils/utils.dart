import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';

class Utils {
  void benchMark2Fn(void Function() fn1, void Function() fn2) {
    final stopwatch1 = Stopwatch()..start();
    fn1();
    stopwatch1.stop();
    final stopwatch2 = Stopwatch()..start();
    fn2();
    stopwatch2.stop();
    final duration1 = stopwatch1.elapsed;
    final duration2 = stopwatch2.elapsed;
    final difference = (duration1 - duration2).inMicroseconds / 1000.0;
    String comparisonText;
    if (duration1 < duration2) {
      comparisonText = 'Fn1 is faster with ${difference.toString()}';
    } else if (duration1 > duration2) {
      comparisonText = 'Fn2 is faster with ${difference.toString()}';
    } else {
      comparisonText = 'Functions equal in speed';
    }
    debugPrint(comparisonText);
  }

  static List<T> zip2Lists<T, A, B>(
    List<A> listA,
    List<B> listB,
    T Function(A, B) combiner,
  ) {
    final length = listA.length < listB.length ? listA.length : listB.length;
    return List<T>.generate(
        length, (index) => combiner(listA[index], listB[index]));
  }

  FutureOr<T> performWithConnectionCheck<T>(
    FutureOr<T> Function() whenConnected,
    FutureOr<T> Function() whenOffline,
  ) async {
    final hasConnection = await InternetConnectionChecker().hasConnection;
    if (hasConnection) {
      try {
        return await whenConnected();
      } catch (e) {
        throw CustomException(message: e.toString());
      }
    } else {
      return await whenOffline();
    }
  }
}
