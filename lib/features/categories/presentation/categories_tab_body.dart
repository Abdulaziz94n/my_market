import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_main_body.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class CategoriesTabBody extends ConsumerWidget {
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
        Card(
          color: colors.background,
          child: const ItemsCard(title: 'Familles'),
        ),
      ],
    );
  }
}

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AppText(text: title),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Card(
              color: colors.grey,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
