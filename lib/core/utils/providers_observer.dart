// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class Logger extends ProviderObserver {
//   @override
//   void didDisposeProvider(
//       ProviderBase<Object?> provider, ProviderContainer container) {
//     print('DISPOSE PROVIDER": "${provider.name ?? provider.runtimeType}');
//     super.didDisposeProvider(provider, container);
//   }

//   @override
//   void didUpdateProvider(
//     ProviderBase<Object?> provider,
//     Object? previousValue,
//     Object? newValue,
//     ProviderContainer container,
//   ) {
//     if (newValue is AsyncData<List<Object>>) {
//       print('''
// {
//   "provider": "${provider.name ?? provider.runtimeType}",
//   "newValue": "${newValue.value.length}"
// }''');
//     } else {
//       print('''
// {
//   "provider": "${provider.name ?? provider.runtimeType}",
//   "newValue": "$newValue"
// }''');
//     }
//   }
// }

// class DisposeLogger extends ProviderObserver {
//   @override
//   void didDisposeProvider(
//       ProviderBase<Object?> provider, ProviderContainer container) {
//     print('DISPOSE PROVIDER": "${provider.name ?? provider.runtimeType}');
//     super.didDisposeProvider(provider, container);
//   }
// }
