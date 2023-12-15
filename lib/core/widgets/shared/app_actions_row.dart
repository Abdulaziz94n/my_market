import 'package:flutter/material.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_action_button.dart';
import 'package:my_market/core/widgets/shared/app_bordered_text_field.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/product/presentation/widgets/product_filter_popup_button.dart';

class AppActionsRow extends StatelessWidget {
  const AppActionsRow({
    super.key,
    required this.showActions,
    required this.searchCtrl,
    required this.onSearch,
    required this.actions,
  });
  final ValueNotifier<bool> showActions;
  final TextEditingController searchCtrl;
  final VoidCallback onSearch;
  final List<AppActionButton> actions;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 200,
              child: AppBorderedTextField(
                controller: searchCtrl,
                hintText: 'Recherche id, Name, Codebar...',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const HorizontalSpacingWidget(Sizes.p8),
            IconButton(
              onPressed: onSearch,
              icon: Icon(
                Icons.search,
                color: colors.onPrimary,
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Icon(
                Icons.settings,
                color: showActions.value ? colors.primary : colors.onPrimary,
              ),
              const HorizontalSpacingWidget(Sizes.p8),
              if (!showActions.value) const ProductFilterPopupButton(),
              if (showActions.value)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: actions,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
