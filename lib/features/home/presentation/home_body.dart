import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
    required this.selectedRail,
  });
  final NavigationRailType selectedRail;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text('HomeBody $selectedRail'),
    );
  }
}
