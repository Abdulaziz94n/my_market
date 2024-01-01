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
    required this.onShow,
  });
  final ValueNotifier<bool> showActions;
  final TextEditingController searchCtrl;
  final VoidCallback onSearch;
  final List<AppActionButton> actions;
  final ValueChanged<bool> onShow;
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
        const HorizontalSpacingWidget(Sizes.p32),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.isLargeDesktop
                      ? 800
                      : context.isDesktop
                          ? 600
                          : 400,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => onShow(!showActions.value),
                        child: Icon(
                          Icons.settings,
                          color: showActions.value
                              ? colors.primary
                              : colors.onPrimary,
                        ),
                      ),
                      const HorizontalSpacingWidget(Sizes.p8),
                      !showActions.value
                          ? const ProductFilterPopupButton()
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: actions,
                              ),
                            )
                      // if (!showActions.value) const ProductFilterPopupButton(),
                      // if (showActions.value)
                      //   Align(
                      //     alignment: Alignment.centerRight,
                      //     child: SingleChildScrollView(
                      //       scrollDirection: Axis.horizontal,
                      //       child: Row(
                      //         children: actions,
                      //       ),
                      //     ),
                      //   )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
