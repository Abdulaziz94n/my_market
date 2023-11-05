import 'package:flutter/material.dart';

import '../shared/app_error_widget.dart';
import '../shared/app_loading_indicator.dart';

class AppStreamBuilder<T> extends StatelessWidget {
  const AppStreamBuilder(
      {super.key, required this.stream, required this.streamSuccessWidget});
  final Stream<T> stream;
  final Widget Function(T data) streamSuccessWidget;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream,
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const AppLoadingIndicator();
            case ConnectionState.active:
              if (snapshot.hasError) {
                return const AppErrorWidget();
              } else if (snapshot.hasData) {
                return StreamResultWidget<T>(
                    childBuilder: streamSuccessWidget,
                    resultData: snapshot.data as T);
              } else {
                return const AppErrorWidget();
              }
            default:
              return const AppErrorWidget();
          }
        }));
  }
}

class StreamResultWidget<T> extends StatelessWidget {
  const StreamResultWidget(
      {super.key, required this.childBuilder, required this.resultData});
  final Widget Function(T data) childBuilder;
  final T resultData;
  @override
  Widget build(BuildContext context) {
    return childBuilder(resultData);
  }
}
