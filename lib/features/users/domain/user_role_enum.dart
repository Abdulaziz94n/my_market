enum UserRole {
  admin('admin', 1),
  cashier('cashier', 2),
  employee('employee', 3);

  const UserRole(this.type, this.id);
  final String type;
  final int id;

  static UserRole fromString(String val) {
    return switch (val) {
      'cashier' => UserRole.cashier,
      'admin' => UserRole.admin,
      'employee' => UserRole.employee,
      _ => throw UnimplementedError()
    };
  }

  static UserRole fromInt(int val) {
    return switch (val) {
      1 => UserRole.cashier,
      2 => UserRole.admin,
      3 => UserRole.employee,
      _ => throw UnimplementedError()
    };
  }
}
