import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/features/categories/domain/category_model.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: colors.primary,
        ),
        onPressed: () {},
        child: AppText(
          text: '${category.name} (${category.productsCount})',
          style: const TextStyle().colorize(colors.onPrimary),
        ));
  }
}
