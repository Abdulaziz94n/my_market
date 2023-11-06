enum NavigationRailType {
  dashboard('dashboard', 0),
  store('store', 1),
  users('users', 2),
  reports('reports', 3),
  clients('clients', 4),
  orders('orders', 5);

  const NavigationRailType(this.type, this.intVal);
  final String type;
  final int intVal;

  static NavigationRailType fromString(String val) {
    return switch (val) {
      'dashboard' => NavigationRailType.dashboard,
      'store' => NavigationRailType.store,
      'users' => NavigationRailType.users,
      'reports' => NavigationRailType.reports,
      'clients' => NavigationRailType.clients,
      'orders' => NavigationRailType.orders,
      _ => throw UnimplementedError()
    };
  }

  static NavigationRailType fromInt(int val) {
    return switch (val) {
      0 => NavigationRailType.dashboard,
      1 => NavigationRailType.store,
      2 => NavigationRailType.users,
      3 => NavigationRailType.reports,
      4 => NavigationRailType.clients,
      5 => NavigationRailType.orders,
      _ => throw UnimplementedError()
    };
  }
}
