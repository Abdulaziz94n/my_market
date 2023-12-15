// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionController extends Notifier<CurrentConnection> {
  @override
  CurrentConnection build() {
    final connectionStatus = ref.watch(internetConnectionProvider).valueOrNull;
    final result = ref.watch(connectivityProvider).valueOrNull;
    return CurrentConnection(
      connectionStatus: connectionStatus,
      result: result,
    );
  }

  // void listenAndAct(AppLifecycleState state) {
  //   switch (state) {
  //     case AppLifecycleState.inactive:
  //       return;
  //     case AppLifecycleState.detached:
  //       return;
  //     case AppLifecycleState.resumed:
  //       return;
  //     case AppLifecycleState.paused:
  //       return;
  //     default:
  //       assert(false, "Invalid AppLifecycleState value: $state");
  //   }
  // }
}

final currentConnectionProvider =
    NotifierProvider<InternetConnectionController, CurrentConnection>(
        InternetConnectionController.new);

final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  return Connectivity().onConnectivityChanged;
});

final internetConnectionProvider =
    StreamProvider<InternetConnectionStatus>((ref) {
  return InternetConnectionChecker().onStatusChange;
});

// TODO: Move to another file
class CurrentConnection {
  final InternetConnectionStatus? connectionStatus;
  final ConnectivityResult? result;
  CurrentConnection({
    this.connectionStatus,
    this.result,
  });

  bool get hasConnection =>
      connectionStatus == InternetConnectionStatus.connected;

  CurrentConnection copyWith({
    InternetConnectionStatus? connectionStatus,
    ConnectivityResult? result,
  }) {
    return CurrentConnection(
      connectionStatus: connectionStatus ?? this.connectionStatus,
      result: result ?? this.result,
    );
  }

  @override
  String toString() =>
      'CurrnetConnection(connectionStatus: $connectionStatus, result: $result)';

  @override
  bool operator ==(covariant CurrentConnection other) {
    if (identical(this, other)) return true;

    return other.connectionStatus == connectionStatus && other.result == result;
  }

  @override
  int get hashCode => connectionStatus.hashCode ^ result.hashCode;
}
