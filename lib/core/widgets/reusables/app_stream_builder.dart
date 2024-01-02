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
              debugPrint('WAiting');
              return const AppLoadingIndicator();
            case ConnectionState.active:
              if (snapshot.hasError) {
                debugPrint('HAS ERROR');
                return const AppErrorWidget();
              } else if (snapshot.hasData) {
                debugPrint('HAS DATA');
                return StreamResultWidget<T>(
                    childBuilder: streamSuccessWidget,
                    resultData: snapshot.data as T);
              } else {
                debugPrint('ELSE ENTERED');
                return const AppErrorWidget();
              }
            case ConnectionState.none:
              return const AppErrorWidget();
            case ConnectionState.done:
              debugPrint('Done');
              return StreamResultWidget<T>(
                  childBuilder: streamSuccessWidget,
                  resultData: snapshot.data as T);
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
