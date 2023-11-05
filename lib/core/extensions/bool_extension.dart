import '/core/exceptions/app_exceptions.dart';

extension BoolX on bool {
  bool fromInt(int val) {
    return switch (val) {
      1 => true,
      0 => false,
      _ => throw CustomException(message: 'Invalid Int to Bool val')
    };
  }

  int get toInt {
    return this ? 0 : 1;
  }
}
