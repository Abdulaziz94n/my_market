// ignore_for_file: unused_import

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/router/app_router.dart';
import 'package:my_market/core/theme/themes.dart';
import 'package:my_market/firebase_options.dart';
import 'package:window_size/window_size.dart';

/// ref.read(notifier).fn() of B Controller called in A Controller ? or go Like like [OrderItemsList] onIncrease...
// submitOrderController only for 1 async call + access to another controller through ref ?

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMaxSize(const Size(1920, 1200));
    setWindowMinSize(const Size(1000, 800));
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: 'App Name',
      theme: AppThemes().lightTheme,
    );
  }
}
