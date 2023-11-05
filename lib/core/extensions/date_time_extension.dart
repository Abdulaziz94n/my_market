import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get yMdFromDateOnly =>
      toString().replaceAll(RegExp(r'\s00:00:00.000'), '');

  String get yMdFromUTC => toString().substring(0, 10);

  String get dateAsString => DateFormat('yyyy-MM-dd').format(this);

  String get getShortDateAsString => DateFormat('dd MMMM yy').format(this);

  DateTime get currentMonthEnd => month < 12
      ? DateTime(year, month + 1, 1, 00, 00, 00, -1)
      : DateTime(year + 1, 1, 1, 00, 00, 00, -1);

  DateTime get currentMonthStart => DateTime(year, month, 1, 0, 0, 1);

  DateTime monthEnd(int passedMonth) {
    return passedMonth < 12
        ? DateTime(year, passedMonth + 1, 1, 00, 00, 00, -1)
        : DateTime(year + 1, 1, 1, 00, 00, 00, -1);
  }

  DateTime monthStart(int passedMonth) {
    return DateTime(year, passedMonth, 1);
  }

  DateTime get dayStart {
    return DateTime(year, month, day, 0, 0, 0, 0, 0);
  }

  DateTime get dayEnd {
    return DateTime(year, month, day, 23, 59, 59, 999, 999);
  }

  int get getWeekFirstDayStartInMilliSecondsSinceEpoch {
    var currentDay = weekday;
    var toFirstDayDiff = 0;
    while (currentDay > 1) {
      currentDay--;
      toFirstDayDiff++;
    }
    var firstWeekDay = subtract(Duration(days: toFirstDayDiff));
    var res = _getDateDayStart(firstWeekDay).millisecondsSinceEpoch;
    return res;
  }

  int get getWeekLastDayStartInMilliSecondsSinceEpoch {
    var currentDay = weekday;
    var toLastDayDiff = 0;
    while (currentDay < 7) {
      currentDay++;
      toLastDayDiff++;
    }
    var firstWeekDay = add(Duration(days: toLastDayDiff));
    var res = _getDateDayEnd(firstWeekDay).millisecondsSinceEpoch;
    return res;
  }

  bool isWithinRange(DateTime startDate, DateTime endDate) {
    return isAfter(startDate) && isBefore(endDate);
  }

  DateTime _getDateDayStart(DateTime date) {
    final res = DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);
    return res;
  }

  DateTime _getDateDayEnd(DateTime date) {
    final res = DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999);
    return res;
  }
}
