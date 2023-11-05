import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/exceptions/app_exceptions.dart';
import '/core/widgets/shared/app_error_alert.dart';
import '/core/widgets/shared/app_loading_indicator.dart';
import '/core/widgets/shared/app_success_alert.dart';

class Utils {
  // static void handleAsyncVal({
  //   required BuildContext context,
  //   required AsyncValue? previous,
  //   required AsyncValue next,
  // }) {
  //   String errorMessage(Object? error) {
  //     if (error is AppException) {
  //       return error.message;
  //     } else {
  //       return error.toString();
  //     }
  //   }
  //   if (next.isLoading) {
  //     showDialog(
  //       context: context,
  //       builder: (context) => const AppLoadingIndicator(),
  //     );
  //   }
  //   if (previous!.isLoading && (!next.isLoading)) {
  //     print('POPPED');
  //     context.canPop() ? context.pop() : null;
  //   }
  //   if (!next.isLoading && next.hasError) {
  //     final message = errorMessage(next.error);
  //     showDialog(
  //       context: context,
  //       builder: (context) => AppErrorAlert(
  //         contentText: 'Error Message here $message',
  //       ),
  //     );
  //   }
  //   if (next.hasValue && !next.isLoading && !next.hasError) {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AppSuccessAlert(
  //         contentText: 'Error Message here',
  //         pop: context.pop,
  //       ),
  //     );
  //   }
  // }

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
}
