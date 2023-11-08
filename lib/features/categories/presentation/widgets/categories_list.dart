import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_circle.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/categories/domain/categories_model.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesList = DummyData.categoriesList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText(text: 'Plus Utilisees'),
        const VerticalSpacingWidget(Sizes.p4),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryCard(
                category: categoriesList[index], isSelected: false),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
  });
  final CategoryModel category;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final borderColor = isSelected ? colors.onPrimary : colors.primary;
    final color = isSelected ? colors.primary : colors.background;
    return SizedBox(
      width: 125,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: AppBorderedCircle(
                  radius: 40,
                  borderColor: borderColor,
                  backgroundColor: color,
                  child: Center(
                    child: AppText(
                      text: category.name[0],
                      style: TextStyle(color: borderColor, fontSize: 50),
                    ),
                  ),
                ),
              ),
              const VerticalSpacingWidget(Sizes.p4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: category.name.capEach),
                  AppText(text: '${category.productsCount} Produits'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
