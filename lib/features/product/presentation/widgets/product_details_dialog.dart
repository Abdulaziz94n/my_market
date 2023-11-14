import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_box.dart';
import 'package:my_market/core/widgets/reusables/app_divider.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class ProductDetailsDialog extends ConsumerWidget {
  const ProductDetailsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    return Padding(
      padding: Sizes.defaultDialogPadding,
      child: SizedBox(
        width: Sizes.defaultDialogWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              text: 'Details de produit',
              style: context.appTextTheme.titleMedium,
            ),
            const VerticalSpacingWidget(Sizes.p12),
            ClipRRect(
              borderRadius: Sizes.defaultBorderRadius,
              child: const AppBorderedBox.withChild(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DetailRow(label: 'ID', value: 'Value', isFirst: true),
                  _DetailRow(label: 'ID', value: 'Value'),
                  _DetailRow(label: 'ID', value: 'Value', isLast: true),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.isLast = false,
    this.isFirst = false,
  });
  final String label;
  final String value;
  final bool isLast;
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: isFirst
                    ? const BorderRadius.only(topRight: Radius.circular(16))
                    : isLast
                        ? const BorderRadius.only(
                            bottomRight: Radius.circular(16))
                        : BorderRadius.zero,
                child: ColoredBox(
                  color: colors.active,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText(
                      text: '$label:',
                      style: const TextStyle().colorize(colors.onPrimary),
                    ),
                  ),
                ),
              ),
              if (!isLast) AppDivider(color: colors.white)
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ColoredBox(
                color: colors.background,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText(
                    text: value,
                  ),
                ),
              ),
              if (!isLast) AppDivider(color: colors.primary)
            ],
          ),
        ),
      ],
    );
  }
}
