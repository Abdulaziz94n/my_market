import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/reusables/app_stream_builder.dart';
import 'package:my_market/core/widgets/shared/app_main_body.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/categories/data/plus_category_repository.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/categories/domain/plus_category_model.dart';
import 'package:my_market/features/categories/presentation/widgets/settings_category_item.dart';
import 'package:my_market/features/categories/presentation/widgets/settings_item_list_card.dart';
import 'package:my_market/features/categories/presentation/widgets/settings_plus_category_item.dart';
import 'package:my_market/features/categories/presentation/widgets/settings_product_providers_item.dart';
import 'package:my_market/features/product/data/product_provider_repository.dart';
import 'package:my_market/features/product/domain/product_provider_model.dart';

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
                  AppStreamBuilder(
                    stream: ref.watch(categoryRepo).getAll(),
                    streamSuccessWidget: (categories) {
                      print(categories);
                      return ItemsCard<CategoryModel>(
                        key: UniqueKey(),
                        title: 'Familles',
                        items: categories,
                        builder: (category) =>
                            CategoryItemCard(category: category),
                      );
                    },
                  ),
                  AppStreamBuilder(
                    stream: ref.watch(plusCategoryRepo).getAll(),
                    streamSuccessWidget: (plusCategories) =>
                        ItemsCard<PlusCategoryModel>(
                            key: UniqueKey(),
                            title: 'Plus Utilities',
                            items: plusCategories,
                            builder: (plusCategory) => PlusCategoryItemCard(
                                  plusCategory: plusCategory,
                                )),
                  ),
                  AppStreamBuilder(
                    stream: ref.watch(productProviderRepo).getAll(),
                    streamSuccessWidget: (providers) =>
                        ItemsCard<ProductProviderModel>(
                            key: UniqueKey(),
                            title: 'Fournisseurs',
                            items: providers,
                            builder: (productProvider) =>
                                ProductProviderModelItemCard(
                                  productProvider: productProvider,
                                )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
