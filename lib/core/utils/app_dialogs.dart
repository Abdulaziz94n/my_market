import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/shared/app_loading_indicator.dart';
import '../widgets/shared/app_success_alert.dart';
import '/core/widgets/shared/app_error_alert.dart';
import '/core/widgets/shared/app_two_actions_dialog.dart';
import '/core/widgets/shared/app_warning_alert.dart';

const _kBarrierColor = Colors.black26;

class AppDialogs {
  static Future successDialog({
    required BuildContext context,
    required String contentText,
    Color? backgroundColor,
    VoidCallback? pop,
    bool isDismissable = true,
  }) async {
    showAdaptiveDialog(
      barrierColor: _kBarrierColor,
      barrierDismissible: isDismissable,
      context: context,
      builder: (context) => AppSuccessAlert(
        backgroundColor: backgroundColor,
        contentText: contentText,
        pop: pop,
      ),
    );
  }

  static Future warningDialog({
    required BuildContext context,
    required String contentText,
    VoidCallback? onAction,
    VoidCallback? pop,
    IconData? icon,
    Color? iconColor,
    Color? backgroundColor,
    bool isDismissable = false,
  }) async {
    showAdaptiveDialog(
      barrierColor: _kBarrierColor,
      barrierDismissible: isDismissable,
      context: context,
      builder: (context) => AppWarningAlert(
        backgroundColor: backgroundColor,
        contentText: contentText,
        onAction: onAction,
        pop: pop,
        icon: icon,
        iconColor: iconColor,
      ),
    );
  }

  static Future twoActionsDialog({
    required BuildContext context,
    required Widget content,
    VoidCallback? onAction,
    String? actionText,
    String? cancelText,
    VoidCallback? pop,
    Color? backgroundColor,
    bool isDismissable = false,
  }) async {
    showAdaptiveDialog(
      barrierColor: _kBarrierColor,
      barrierDismissible: isDismissable,
      context: context,
      builder: (context) => AppTwoActionsAlert(
        backgroundColor: backgroundColor,
        content: content,
        onAction: onAction,
        actionText: actionText,
        cancelText: cancelText,
        pop: pop,
      ),
    );
  }

  static Future failureDialog({
    required BuildContext context,
    required String contentText,
    VoidCallback? pop,
    Color? backgroundColor,
    bool isDismissable = false,
  }) async {
    showAdaptiveDialog(
        barrierColor: _kBarrierColor,
        barrierDismissible: isDismissable,
        context: context,
        builder: (context) => AppErrorAlert(
              backgroundColor: backgroundColor,
              pop: pop,
              contentText: contentText,
            ));
  }

  static Future customDialog({
    required BuildContext context,
    required Widget dialog,
    bool isDismissable = true,
  }) {
    return showAdaptiveDialog(
      barrierColor: _kBarrierColor,
      barrierDismissible: isDismissable,
      context: context,
      builder: (context) => Dialog(child: dialog),
    );
  }

  static Future<void> asyncDialog({
    required BuildContext context,
    required Future future,
    required VoidCallback? onSuccess,
    required VoidCallback pop,
    required Function(String) onError,
    VoidCallback? onBreak,
    bool confirmedDialg = false,
    bool breakCondition = false,
    Widget Function(BuildContext context)? loadingIndicator,
  }) async {
    showAdaptiveDialog(
      context: context,
      builder: loadingIndicator ?? (ctx) => const AppLoadingIndicator(),
    );

    try {
      await future;
      if (breakCondition) {
        log('INSIDE BREAK');
        pop();
        onBreak!();
        return;
      }
      if (confirmedDialg) {
        pop();
        return;
      }
      pop();
      onSuccess!();
    } on SocketException {
      print('ON SOCKET EXCEPTION ENTERED');
      // TODO:
      const errorMessage = 'connectionError';
      pop();
      onError(errorMessage);
    } catch (e) {
      const errorMessage = 'somethingWentWrong';
      pop();
      onError(errorMessage);
    }
  }

  static void syncDialog({
    required BuildContext context,
    required VoidCallback action,
    required String successMessage,
    Color? dialogBgColor,
    String? errorMessage,
    bool fromDialog = false,
  }) {
    if (fromDialog) {
      action();
      context.pop();
      showAdaptiveDialog(
        context: context,
        builder: (context) => AppSuccessAlert(
          contentText: successMessage,
          backgroundColor: dialogBgColor,
        ),
      );
    } else {
      action();
      showAdaptiveDialog(
        context: context,
        builder: (context) => AppSuccessAlert(contentText: successMessage),
      );
    }
  }

  static Future<DateTime?> pickDateDialog(BuildContext context,
      {DateTime? firstDate, DateTime? lastDate}) async {
    DateTime now = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate ?? DateTime(now.year, 1),
      lastDate: lastDate ?? DateTime(now.year, 12),
    );

    if (selectedDate == null) return null;
    return selectedDate;
  }

  static Future<TimeOfDay?> pickTimeDialog(BuildContext context) async {
    TimeOfDay initialTime = const TimeOfDay(hour: 09, minute: 0);
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (selectedTime == null) return null;

    return selectedTime;
  }

  static Future<DateTime?> pickDateTimeDialog(BuildContext context) async {
    final date = await pickDateDialog(context);
    if (date == null) return null;
    if (context.mounted) {
      final time = await pickTimeDialog(context);
      if (time == null) return null;
      final selectedDateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
      return selectedDateTime;
    }
    return null;
  }
}
