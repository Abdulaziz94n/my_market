import 'package:flutter/material.dart';

class AppSnackBars {
  static showSnackBar(
      {required String contentText,
      Duration? duration,
      required BuildContext context}) {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    scaffoldMessengerState
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(contentText),
        duration: duration ?? const Duration(seconds: 1),
      ));
  }

  static showErrorSnackBar(
      {required String contentText,
      Duration? duration,
      required BuildContext context}) {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    scaffoldMessengerState
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(contentText),
        duration: duration ?? const Duration(seconds: 1),
      ));
  }

  // showToast ?

  // most used DateFormats?

  //
}
