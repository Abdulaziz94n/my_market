import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import '/core/widgets/shared/app_error_alert.dart';

import '../widgets/shared/app_loading_indicator.dart';
import '../widgets/shared/app_success_alert.dart';

class AppDialogs {
  static Future successDialog(
      {required BuildContext context, required String contentText}) async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AppSuccessAlert(contentText: contentText),
    );
  }

  static Future warningDialog(
      {required BuildContext context, required String contentText}) async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(content: Text(contentText)),
    );
  }

  static Future failureDialog(
      {required BuildContext context, required String contentText}) async {
    showAdaptiveDialog(
        context: context,
        builder: (context) => AppErrorAlert(contentText: contentText));
  }

  static Future<void> showAndDismissAsyncDialog({
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
      const errorMessage = 'connectionError.tr';
      pop();
      onError(errorMessage);
    } catch (e) {
      const errorMessage = 'somethingWentWrong.tr';
      pop();
      onError(errorMessage);
    }
  }

  static Future customDialog({
    required BuildContext context,
    required Widget dialog,
  }) {
    return showAdaptiveDialog(context: context, builder: (context) => dialog);
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
