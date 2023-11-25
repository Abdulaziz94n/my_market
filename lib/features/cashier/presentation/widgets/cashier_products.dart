import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/extensions/list_extenstion.dart';
import 'package:my_market/core/widgets/reusables/traingle_painter.dart';
import 'package:my_market/core/widgets/shared/app_bordered_text_field.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/cashier/presentation/widgets/cashier_products_table.dart';
import 'package:my_market/features/cashier/presentation/widgets/count_selector.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/navigation_rail_controller.dart';

class CashierProducts extends StatefulHookConsumerWidget {
  const CashierProducts({
    super.key,
  });

  @override
  ConsumerState<CashierProducts> createState() => _CashierProductsState();
}

class _CashierProductsState extends ConsumerState<CashierProducts> {
  final _counterSelectorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final show = useState(false);
    const traingleSide = 25.0;
    return LayoutBuilder(builder: (context, c) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            SizedBox(
              width: c.maxWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const AppText(text: '13 : 30 : 55 | 05 . Jan . 2023'),
                  Positioned(
                      right: 0,
                      child: AppText.clickable(
                        text: 'Retour au menu',
                        onClick: () => ref
                            .read(navigationRailProvider.notifier)
                            .setTab(NavigationRailType.dashboard),
                      ))
                ],
              ),
            ),
            const VerticalSpacingWidget(Sizes.p16),
            const ProductsSearchRow(),
            const VerticalSpacingWidget(Sizes.p16),
            const Expanded(child: CashierProductsTable()),
            AnimatedRotation(
              duration: Duration.zero,
              turns: !show.value ? 0 : 1 / 2,
              child: TraingleWidget(
                onTap: () => show.value = !show.value,
                paintingStyle: PaintingStyle.fill,
                height: traingleSide,
                width: traingleSide * 2,
              ),
            ),
            if (show.value) ...[
              const VerticalSpacingWidget(Sizes.p8),
              SizedBox(
                width: double.maxFinite,
                child: CountSelector(
                  key: _counterSelectorKey,
                  onSelect: (value) {
                    print('selected val = $value');
                  },
                ),
              ),
            ]
          ],
        ),
      );
    });
  }
}

// TODO : check for refactor
class ProductsSearchRow extends StatefulHookWidget {
  const ProductsSearchRow({
    super.key,
  });

  @override
  State<ProductsSearchRow> createState() => _ProductsSearchRowState();
}

class _ProductsSearchRowState extends State<ProductsSearchRow> {
  @override
  Widget build(BuildContext context) {
    final searchCtrl = useTextEditingController();
    return Row(children: [
      Expanded(
        child: LayoutBuilder(builder: (context, c) {
          return PopupMenuButton(
            constraints: BoxConstraints(maxWidth: c.maxWidth),
            child: AppBorderedTextField(
              controller: null,
              suffixIcon: Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: context.appColors.primary,
              ),
              hintText: 'asd',
              enabled: false,
            ),
            itemBuilder: (context) => DummyData.categoriesList.toPopupItems(
                childBuilder: (item) => SizedBox(
                      width: double.maxFinite,
                      child: AppText(text: item.name),
                    )),
          );
        }),
        // child: AppDropDown(
        //   iconDisabledColor: context.appColors.primary,
        //   enabled: false,
        //   height: 40,
        //   hint: 'Recherche par categorie...',
        //   items: DummyData.categoriesList
        //       .toDropdownItems(childBuilder: (item) => Text(item.name)),
        //   contentPadding: const EdgeInsets.all(Sizes.p8),
        //   onChanged: (val) {},
        // ),
      ),
      const HorizontalSpacingWidget(Sizes.p8),
      Expanded(
        child: AppBorderedTextField(
          contentPadding: const EdgeInsets.all(Sizes.p8),
          prefixIcon: const Icon(Icons.search),
          controller: searchCtrl,
          hintText: 'Rechercher d\'un Article: Nom, Code...',
        ),
      ),
      const HorizontalSpacingWidget(Sizes.p8),
      IconButton.filled(
          style:
              IconButton.styleFrom(backgroundColor: context.appColors.primary),
          onPressed: () {},
          icon: const Icon(Icons.search)),
      const HorizontalSpacingWidget(Sizes.p8),
    ]);
  }
}
