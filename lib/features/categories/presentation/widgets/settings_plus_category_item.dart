import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/features/categories/domain/plus_category_model.dart';

class PlusCategoryItemCard extends StatelessWidget {
  const PlusCategoryItemCard({
    super.key,
    required this.plusCategory,
  });

  final PlusCategoryModel plusCategory;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: colors.primary,
        ),
        onPressed: () {},
        child: AppText(
          text: '${plusCategory.name} (${plusCategory.productsCount})',
          style: const TextStyle().colorize(colors.onPrimary),
        ));
  }
}
