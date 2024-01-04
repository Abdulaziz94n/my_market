import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/shared/app_main_body.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/categories/domain/plus_category_model.dart';
import 'package:my_market/features/product/domain/product_provider_model.dart';
import 'package:my_market/main.dart';

class CategoriesTabBody extends HookConsumerWidget {
  const CategoriesTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    return AppMainBody(
      isScrollable: true,
      title: 'Parameters & Familles',
      children: [
        SizedBox(
          height: context.screenHeight,
          child: Card(
            color: colors.background,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ItemsCard<CategoryModel>(
                    title: 'Familles',
                    items: objectBox.categoryBox
                        .getAll()
                        .map((e) => CategoryModel.fromEntity(e))
                        .toList(),
                    builder: (category) => CategoryItemCard(category: category),
                  ),
                  ItemsCard<PlusCategoryModel>(
                      title: 'Plus Utilities',
                      items: const [],
                      builder: (plusCategory) =>
                          PlusCategoryItemCard(plusCategory: plusCategory)),
                  ItemsCard<ProductProviderModel>(
                      title: 'Fournisseurs',
                      items: const [],
                      builder: (productProvider) =>
                          ProductProviderModelItemCard(
                              productProvider: productProvider)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

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

class ItemsCard<T> extends StatelessWidget {
  const ItemsCard({
    super.key,
    required this.title,
    required this.items,
    required this.builder,
  });
  final String title;
  final List<T> items;
  final Widget Function(T item) builder;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.all(Sizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
            child: AppText(text: title),
          ),
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Card(
              color: colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p8),
                child: Wrap(
                  children: List.generate(
                    items.length,
                    (index) => builder(items[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
