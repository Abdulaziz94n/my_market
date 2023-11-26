import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/widgets/shared/app_error_widget.dart';
import '/core/widgets/shared/app_loading_indicator.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loadingIndicator,
    this.errorBuilder,
    this.skipLoadingOnRefresh = true,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final bool skipLoadingOnRefresh;
  final Widget? loadingIndicator;
  final Widget Function(Object error, StackTrace st)? errorBuilder;
  @override
  Widget build(BuildContext context) {
    return value.when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      data: data,
      error: errorBuilder ??
          (e, st) => Center(
                child: AppErrorWidget(
                  errorText: e.toString(),
                ),
              ),
      loading: () =>
          loadingIndicator ??
          const Center(
            child: AppLoadingIndicator(),
          ),
    );
  }
}

class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
    this.loadingIndicator,
    this.errorBuilder,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loadingIndicator;
  final Widget Function(Object error, StackTrace st)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => SliverToBoxAdapter(
        child: loadingIndicator ??
            const Center(
              child: AppLoadingIndicator(),
            ),
      ),
      error: errorBuilder ??
          (e, st) => SliverToBoxAdapter(
                child: Center(
                  child: AppErrorWidget(
                    errorText: e.toString(),
                  ),
                ),
              ),
    );
  }
}
