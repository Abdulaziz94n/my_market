import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/features/product/domain/product_provider_model.dart';

class ProductProviderModelItemCard extends StatelessWidget {
  const ProductProviderModelItemCard({
    super.key,
    required this.productProvider,
  });

  final ProductProviderModel productProvider;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: colors.primary,
        ),
        onPressed: () {},
        child: AppText(
          text: '${productProvider.name} (No)',
          style: const TextStyle().colorize(colors.onPrimary),
        ));
  }
}
