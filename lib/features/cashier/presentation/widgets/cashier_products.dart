import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/list_extenstion.dart';
import 'package:my_market/core/widgets/shared/app_dropdown.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_text_field_bordered.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';

class CashierProducts extends HookConsumerWidget {
  const CashierProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCtrl = useTextEditingController();
    return Column(
      children: [
        const AppText(text: '13 : 30 : 55 | 05 . Jan . 2023'),
        const VerticalSpacingWidget(Sizes.p16),
        Row(children: [
          const HorizontalSpacingWidget(Sizes.p8),
          Expanded(
            child: AppDropDown(
              height: 40,
              hint: 'Recherche par categorie...',
              items: ['1', '2']
                  .toDropdownItems(childBuilder: (item) => Text(item)),
              contentPadding: const EdgeInsets.all(Sizes.p8),
              onChanged: (val) {},
            ),
          ),
          const HorizontalSpacingWidget(Sizes.p8),
          Expanded(
            child: AppRoundedTextField(
              contentPadding: const EdgeInsets.all(Sizes.p8),
              prefixIcon: const Icon(Icons.search),
              controller: searchCtrl,
              hintText: 'Rechercher d\'un Article: Nom, Code...',
            ),
          ),
          const HorizontalSpacingWidget(Sizes.p8),
        ]),
      ],
    );
  }
}
