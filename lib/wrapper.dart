import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/utils/network.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _connectionProviderlistener(ref, context);
    return child;
  }

  // TODO: Move to another File
  _connectionProviderlistener(
    WidgetRef ref,
    BuildContext context,
  ) async {
    ref.listen(
      currentConnectionProvider.select((value) => value.connectionStatus),
      (previous, next) async {
        if (previous != next) {
          return switch (next) {
            null => null,
            InternetConnectionStatus.disconnected => context.showBanner(
                content: const Text('No Internet Connection'),
                onClose: () {},
              ),
            InternetConnectionStatus.connected => context.showBanner(
                content: const Text('Internet Connected'),
                duration: const Duration(seconds: 2),
                onClose: () {},
              ),
          };
        }
      },
    );
  }
}
