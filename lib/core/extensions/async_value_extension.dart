// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '/core/exceptions/app_exception.dart';
// import '/core/widgets/app_alert_dialog.dart';

// extension AsyncValueUI on AsyncValue {
//   void showAlertDialogOnError(BuildContext context) {
//     if (!isLoading && hasError) {
//       final message = _errorMessage(error);
//       showDialog(
//         context: context,
//         builder: (context) => AppAlertDialog(
//           contentText: message.toString(),
//           title: 'Error Title',
//           pop: context.pop,
//         ),
//       );
//     }
//   }

//   String _errorMessage(Object? error) {
//     if (error is AppException) {
//       return error.message;
//     } else {
//       return error.toString();
//     }
//   }
// }
