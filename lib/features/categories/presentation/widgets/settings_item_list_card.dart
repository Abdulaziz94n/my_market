import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/string_extension.dart';
import 'package:my_market/core/utils/app_dialogs.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_text_field.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/categories/data/plus_category_repository.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/categories/domain/plus_category_model.dart';
import 'package:my_market/features/product/data/product_provider_repository.dart';
import 'package:my_market/features/product/domain/product_provider_model.dart';
import 'package:uuid/uuid.dart';

class ItemsCard<T> extends ConsumerStatefulWidget {
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
  ConsumerState<ItemsCard<T>> createState() => _ItemsCardState<T>();
}

class _ItemsCardState<T> extends ConsumerState<ItemsCard<T>> {
  late List<Widget> children;
  late TextEditingController newCtrl;
  late FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    children = List.generate(
        widget.items.length,
        (index) => Padding(
            padding: const EdgeInsets.all(Sizes.p4),
            child: widget.builder(widget.items[index])));

    newCtrl = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(_addItemListener);
  }

  @override
  void didUpdateWidget(covariant ItemsCard<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    children = List.generate(
        widget.items.length,
        (index) => Padding(
            padding: const EdgeInsets.all(Sizes.p4),
            child: widget.builder(widget.items[index])));
  }

  @override
  void dispose() {
    focusNode.removeListener(_addItemListener);
    focusNode.dispose();
    newCtrl.dispose();
    super.dispose();
  }

  _addItemListener() {
    if (!newCtrl.text.nullOrEmpty && !focusNode.hasFocus) {
      AppDialogs.warningDialog(
        onAction: () {
          _addItem(newCtrl.text.trimAndLower);
          context.pop();
        },
        context: context,
        pop: () {
          newCtrl.clear();
          context.pop();
        },
        isDismissable: false,
        contentText: 'Save the changes ?',
        backgroundColor: context.appColors.background,
      );
    }
  }

  _addItem(String name) {
    if (T == CategoryModel) {
      final category = CategoryModel(
          name: name.trimAndLower,
          globalId: const Uuid().v4(),
          createdAt: DateTime.now(),
          createdBy: 'user');
      ref.read(categoryRepo).addCategory(category);
    }

    if (T == PlusCategoryModel) {
      final plusCategory = PlusCategoryModel(
        name: name.trimAndLower,
        globalId: const Uuid().v4(),
        createdAt: DateTime.now(),
        createdBy: 'user',
      );
      ref.read(plusCategoryRepo).addCategory(plusCategory);
    }

    if (T == ProductProviderModel) {
      final productProvider = ProductProviderModel(
        name: name.trimAndLower,
        globalId: const Uuid().v4(),
        createdAt: DateTime.now(),
        createdBy: 'user',
      );
      ref.read(productProviderRepo).addProvider(productProvider);
    }
    newCtrl.clear();
  }

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
            child: AppText(text: widget.title),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Card(
              color: colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                child: Wrap(
                  children: [
                    ...children,
                    Padding(
                      padding: const EdgeInsets.all(Sizes.p4),
                      child: SizedBox(
                        width: 75,
                        child: AppTextField.withController(
                          focusNode: focusNode,
                          isDense: true,
                          hideUnderline: true,
                          controller: newCtrl,
                          onFieldSubmitted: (val) => _addItem(val),
                          hint: 'Ecrivez ici...',
                          hintStyle: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
