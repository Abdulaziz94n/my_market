import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/extensions/textstyle_extension.dart';
import 'package:my_market/core/widgets/reusables/app_bordered_circle.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/async_value_widget.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/categories/domain/category_model.dart';

class CategorySelectionList extends ConsumerWidget {
  const CategorySelectionList({
    super.key,
    required this.onCategorySelect,
    required this.selectedCategory,
  });
  final ValueChanged<CategoryModel> onCategorySelect;
  final CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(watchCategoryList),
      data: (categoriesList) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(text: 'Plus Utilisees'),
          const VerticalSpacingWidget(Sizes.p4),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: categoriesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final isSelected = selectedCategory == categoriesList[index];
                return CategoryCard(
                  category: categoriesList[index],
                  isSelected: isSelected,
                  onSelect: onCategorySelect,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onSelect,
  });
  final CategoryModel category;
  final bool isSelected;
  final ValueChanged<CategoryModel> onSelect;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final borderColor = isSelected ? colors.onPrimary : colors.primary;
    final color = isSelected ? colors.primary : colors.background;
    return SizedBox(
      width: 125,
      child: InkWell(
        onTap: () => onSelect(category),
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
                        text: category.name[0].capFirst,
                        style: TextStyle(color: borderColor, fontSize: 50),
                      ),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(Sizes.p4),
                DefaultTextStyle(
                  style: context.appTextTheme.bodyMedium!.colorize(borderColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: category.name.capEach),
                      const AppText(text: '255 Produits'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
