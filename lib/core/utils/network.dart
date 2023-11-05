// import 'dart:async';
// import 'dart:ui';

// import 'package:connectivity_plus/connectivity_plus.dart';

// class NetworkInfo {
//   NetworkInfo() {
//     init();
//   }

//   late StreamSubscription _connectionListener;

//   void init() {
//     _connectionListener =
//         Connectivity().onConnectivityChanged.listen(listenToConnection);
//   }

//   listenToConnection(ConnectivityResult result) {
//     // final hasConnection = result != ConnectivityResult.none;
//     // Impelement required behavior
//   }

//   void _startListenToConnection() {
//     _connectionListener =
//         Connectivity().onConnectivityChanged.listen(listenToConnection);
//   }

//   void _stopListenToConnection() {
//     _connectionListener.cancel();
//   }

//   void listenAndAct(AppLifecycleState state) {
//     switch (state) {
//       case AppLifecycleState.inactive:
//         return;
//       case AppLifecycleState.detached:
//         return;
//       case AppLifecycleState.resumed:
//         _startListenToConnection();
//         return;
//       case AppLifecycleState.paused:
//         _stopListenToConnection();
//         return;
//       default:
//         assert(false, "Invalid AppLifecycleState value: $state");
//     }
//   }

//   void dispose() {
//     _stopListenToConnection();
//   }
// }
