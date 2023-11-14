import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/home/domain/navigation_rail_enum.dart';

class NavigationRailController extends Notifier<NavigationRailType> {
  @override
  build() {
    return NavigationRailType.dashboard;
  }

  void setTab(NavigationRailType tab) {
    state = tab;
  }
}

final navigationRailProvider =
    NotifierProvider<NavigationRailController, NavigationRailType>(
        NavigationRailController.new);
