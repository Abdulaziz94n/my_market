import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/utils/network.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail.dart';
import 'package:my_market/features/home/domain/navigation_rail_destination_enum.dart';
import 'package:my_market/features/home/presentation/home_body.dart';
import 'package:my_market/features/home/presentation/navigation_rail_controller.dart';
import 'package:my_market/features/product/presentation/products_controller.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('//////////////////////////');
    print(ref.watch(currentConnectionProvider));

    final selectedRail = ref.watch(navigationRailProvider);
    final railDestination = useState(RailDestination.dashboard);
    return AppScaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        ref.read(productsController.notifier).addProduct(DummyData.product);
        print('//////////////////////////');
        print(ref.read(currentConnectionProvider));

        // ref.read(categoriesRepo).addCategory(DummyData.category);
        // ref.read(productsController.notifier).addProduct(Product(
        //     id: const Uuid().v4(),
        //     name: 'test 1',
        //     desc: 'desc',
        //     barcode: '123456',
        //     shortCode: '123',
        //     categoryId: '262f843f-0f3a-44d4-b397-6941470a91db',
        //     sellPrice: 15,
        //     alertCount: 10,
        //     providersDetails: ProvidersDetails(
        //       buyPrice: 10,
        //       providerName: DummyData.productProviders[0],
        //     ),
        //     createdBy: DummyData.usersList[0].id,
        //     createdAt: null,
        //     stockCount: 10));
      }),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (railDestination.value != RailDestination.cashier)
            AppNavigationRail(
              selectedRail: selectedRail,
              onRailSelect: (value) =>
                  ref.read(navigationRailProvider.notifier).setTab(value),
              railDestination: railDestination.value,
              onDestinationSelect: (destination) =>
                  railDestination.value = destination,
            ),
          Expanded(
            child: HomeBody(
              selectedRail: selectedRail,
              railDestination: railDestination.value,
              onPop: () => railDestination.value = RailDestination.dashboard,
            ),
          ),
        ],
      ),
    );
  }
}
