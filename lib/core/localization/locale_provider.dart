import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocalizationProvider extends Notifier<Locale> {
  @override
  build() {
    return const Locale('en');
  }

  selectLocale(Locale? locale, BuildContext context) {
    if (locale == null) return;
    if (locale.languageCode == 'en') state = const Locale('en');
  }
}

final localizationProvider = NotifierProvider<LocalizationProvider, Locale>(
  () => LocalizationProvider(),
);
