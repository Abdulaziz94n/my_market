// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/widgets/reusables/app_scaffold.dart';
import 'package:my_market/core/widgets/shared/app_navigation_rail.dart';
import 'package:my_market/features/categories/data/categories_repository.dart';
import 'package:my_market/features/categories/domain/category_model.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';
import 'package:my_market/features/home/presentation/home_body.dart';
import 'package:my_market/features/home/presentation/navigation_rail_controller.dart';
import 'package:my_market/features/product/data/product_repository.dart';
import 'package:my_market/features/product/domain/product_model.dart';
import 'package:my_market/features/product/domain/product_price_info_model.dart';
import 'package:my_market/features/product/presentation/products_controller.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRail = ref.watch(navigationRailProvider);
    return AppScaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'Title',
                )));
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
          if (selectedRail != NavigationRailType.cashier)
            AppNavigationRail(
              selectedItem: selectedRail,
              onSelect: (value) =>
                  ref.read(navigationRailProvider.notifier).setTab(value),
            ),
          Expanded(
            child: HomeBody(
              selectedRail: selectedRail,
            ),
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;
  OverlayEntry? overlayEntry2;
  bool showOverlay = false;
  int index = 0;
  List<Widget> widgets = [
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(height: 40, width: 60, color: Colors.transparent),
    Container(
      height: 300,
      width: 300,
      color: Colors.green,
      child: TextButton(
        child: const Text('Click Me'),
        onPressed: () {
          print('Clicked');
        },
      ),
    ),
    Container(
      height: 300,
      width: 300,
      color: Colors.black,
      child: TextButton(
        child: const Text('Click Me'),
        onPressed: () {
          print('Clicked');
        },
      ),
    ),
  ];
  final layerLink = LayerLink();
  final textButtonFocusNode = FocusNode();
  final textButtonFocusNode1 = FocusNode();

  void _showOverlay(BuildContext context, int index) async {
    overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            left: index == 0
                ? MediaQuery.of(context).size.width * 0.43
                : MediaQuery.of(context).size.width * 0.5,
            top: MediaQuery.of(context).size.height * 0.09,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  }
                }
              },
              child: widgets[index],
            ),
          );
        });
    overlayEntry2 = OverlayEntry(
        maintainState: true,
        builder: (context) {
          return Positioned(
            left: index == 0
                ? MediaQuery.of(context).size.width * 0.43
                : MediaQuery.of(context).size.width * 0.5,
            top: MediaQuery.of(context).size.height * 0.13,
            child: TextButton(
              onPressed: () {},
              onHover: (val) {
                if (val && showOverlay) {
                  if (index == 0) {
                    textButtonFocusNode.requestFocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.requestFocus();
                  }
                } else {
                  if (index == 0) {
                    textButtonFocusNode.unfocus();
                  } else if (index == 1) {
                    textButtonFocusNode1.unfocus();
                  }
                }
              },
              child: widgets[index + 2],
            ),
          );
        });

    // overlayState!.insert(overlayEntry!);
    overlayState!.insertAll([overlayEntry!, overlayEntry2!]);
  }

  void removeOverlay() {
    overlayEntry!.remove();
    overlayEntry2!.remove();
  }

  @override
  void initState() {
    super.initState();
    textButtonFocusNode.addListener(() {
      if (textButtonFocusNode.hasFocus) {
        _showOverlay(context, 0);
      } else {
        removeOverlay();
      }
    });
    textButtonFocusNode1.addListener(() {
      if (textButtonFocusNode1.hasFocus) {
        _showOverlay(context, 1);
      } else {
        removeOverlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              focusNode: textButtonFocusNode,
              onHover: (val) {
                if (val) {
                  textButtonFocusNode.requestFocus();
                  showOverlay = true;
                }
              },
              onPressed: () {},
              child: const Text('Hover'),
            ),
            TextButton(
              focusNode: textButtonFocusNode1,
              onHover: (val) {
                if (val) {
                  textButtonFocusNode1.requestFocus();
                  showOverlay = true;
                }
              },
              onPressed: () {},
              child: const Text('Hover'),
            ),
          ],
        ),
      ),
    );
  }
}
