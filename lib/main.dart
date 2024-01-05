// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_import, avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/router/app_router.dart';
import 'package:my_market/core/theme/themes.dart';
import 'package:my_market/core/utils/network.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/users/presentation/user_controller.dart';
import 'package:my_market/firebase_options.dart';
import 'package:my_market/object_box_model.dart';
import 'package:my_market/wrapper.dart';
import 'package:window_size/window_size.dart';

// General
/// Add Throwable Function typedef to handle sync throw, maybe async too?
/// ToEntity / FromEntity Codes move to another place
/// Manage ToOne and ToMany Relations between tables

/// ref.read(notifier).fn() of B Controller called in A Controller ? or go Like like [OrderItemsList] onIncrease...
/// submitOrderController only for 1 async call + access to another controller through ref ?
/// ref.invalidate does not trigger loading ? (FutureProvider [fetchTicketNo]) ?
///

//TODO:
/// Migrate collectionRef.add() => collectionRef.doc(modelId).set(data);
/// Move Navigation Rail Widgets from core to home feature.
/// Remove NavigationRailType provider
/// Add AppUser model to be used in the app other than UserModel to hide password data
/// Migrate getting data methods to a Stream-based using objectBox query
///
late ObjectBox objectBox;

resetProductsDb() => objectBox.productBox.removeAll();
resetScaleProductsDb() => objectBox.scaleProductBox.removeAll();
resetProductProvidersDb() => objectBox.productProviderBox.removeAll();
resetCategories() => objectBox.categoryBox.removeAll();
resetPlusCategoriesDb() => objectBox.plusCategoryBox.removeAll();
resetOrdersDb() => objectBox.ordersBox.removeAll();
resetUsersDb() => objectBox.userBox.removeAll();
resetCreditClientDb() => objectBox.creditClientBox.removeAll();
resetCompanyClientDb() => objectBox.companyClientBox.removeAll();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowMaxSize(const Size(1920, 1200));
      setWindowMinSize(const Size(1000, 800));
    }
  }
  final container = ProviderContainer();
  container.read(watchCategoryList);
  container.read(connectivityProvider);
  container.read(internetConnectionProvider);
  runApp(
    UncontrolledProviderScope(container: container, child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      builder: (context, child) => AppWrapper(child: child!),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: 'App Name',
      theme: AppThemes().lightTheme,
    );
  }
}

/**
 * 
Hi all, I'm working on application that support both Local and Remote databases and i have some questions in this regard.
before i started my plan was :
1- create abstract class for both dataSources.
2- create local and remote database classes that inherits the abstract one.
3- when performing an action I do the following
isConnectionActive ? remoteDatasource.myMethod() : localDatasource.myMethod();

Problems I'm seeing:
1- DataSources Function Signatures do not match: Remote database is async while local database is sync
2- Handling exception and errors for local datasource: since local database operations are sync how should I catch errors and throw exceptions for invalid operations? 
3- Architectural confusion related to Service and Repository Pattern for local datasource:  
 */
