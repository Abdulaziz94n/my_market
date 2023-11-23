import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

import '/core/exceptions/app_exceptions.dart';
import '/core/widgets/shared/app_error_alert.dart';
import '/core/widgets/shared/app_loading_indicator.dart';
import '/core/widgets/shared/app_success_alert.dart';

class AsyncValueUtils {
  static void handleAsyncVal({
    required BuildContext context,
    required AsyncValue? previous,
    required AsyncValue next,
    String? successMessage,
    VoidCallback? onSuccessAction,
    VoidCallback? onErrorAction,
    bool dismissableDialog = false,
  }) {
    String errorMessage(Object? error) {
      if (error is AppException) {
        return error.message;
      } else {
        return error.toString();
      }
    }

    final backgroundColor = context.appColors.background;

    if (next.isLoading) {
      showDialog(
        barrierDismissible: dismissableDialog,
        context: context,
        builder: (context) => const AppLoadingIndicator(),
      );
    }
    if (previous!.isLoading && (!next.isLoading)) {
      print('POPPED');
      context.canPop() ? context.pop : null;
    }
    if (!next.isLoading && next.hasError) {
      if (previous.isLoading) context.pop();
      final message = errorMessage(next.error);
      print(message);
      showDialog(
        barrierDismissible: dismissableDialog,
        context: context,
        builder: (context) => AppErrorAlert(
          backgroundColor: backgroundColor,
          contentText: message,
          pop: onErrorAction == null
              ? context.pop
              : () => context.actionAndPop(() {
                    onErrorAction();
                  }),
        ),
      );
    }
    if (next.hasValue && !next.isLoading && !next.hasError) {
      if (previous.isLoading) context.pop();
      showDialog(
        barrierDismissible: dismissableDialog,
        context: context,
        builder: (context) => AppSuccessAlert(
          backgroundColor: backgroundColor,
          contentText: successMessage ?? 'Success Message here',
          pop: onSuccessAction == null
              ? context.pop
              : () => context.actionAndPop(() {
                    onSuccessAction();
                  }),
        ),
      );
    }
  }
}
