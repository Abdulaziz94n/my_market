import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class AppPrimaryCard extends ConsumerWidget {
  const AppPrimaryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.height,
    this.width,
    this.onTap,
  });
  final double? width;
  final double? height;
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      height: height ?? Sizes.appCardHeight,
      child: Card(
        child: InkWell(
          borderRadius: Sizes.defaultBorderRadius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(
                      icon,
                      size: 40,
                      color: context.appColors.primary,
                    )),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(text: title),
                      AppText(
                        text: subTitle,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
