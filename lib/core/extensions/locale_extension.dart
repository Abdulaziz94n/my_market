import 'package:flutter/material.dart';

extension LocaleToString on Locale {
  String get toLangName {
    switch (languageCode) {
      case 'en':
        return 'english';
      case 'tr':
        return 'turkish';
      case 'ja':
        return 'japanese';
      default:
        return 'Not Supported Lang';
    }
  }
}
