// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '/core/widgets/app_error_widget.dart';
// import '/core/widgets/app_loading_indicator.dart';

// class AsyncValueWidget<T> extends StatelessWidget {
//   const AsyncValueWidget({
//     super.key,
//     required this.value,
//     required this.data,
//   });
//   final AsyncValue<T> value;
//   final Widget Function(T) data;

//   @override
//   Widget build(BuildContext context) {
//     return value.when(
//       data: data,
//       error: (e, st) => Center(child: AppErrorWidget(errorText: e.toString())),
//       loading: () => const Center(child: AppLoadingIndicator()),
//     );
//   }
// }

// class AsyncValueSliverWidget<T> extends StatelessWidget {
//   const AsyncValueSliverWidget({
//     super.key,
//     required this.value,
//     required this.data,
//   });
//   final AsyncValue<T> value;
//   final Widget Function(T) data;

//   @override
//   Widget build(BuildContext context) {
//     return value.when(
//       data: data,
//       loading: () =>
//           const SliverToBoxAdapter(child: Center(child: AppLoadingIndicator())),
//       error: (e, st) => SliverToBoxAdapter(
//         child: Center(child: AppErrorWidget(errorText: e.toString())),
//       ),
//     );
//   }
// }
