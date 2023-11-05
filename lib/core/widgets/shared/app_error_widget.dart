import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import 'app_text.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, this.errorText});
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
          text: errorText ?? 'Something Went Wrong',
          style: context.appTextTheme.titleSmall!),
    );
  }
}
