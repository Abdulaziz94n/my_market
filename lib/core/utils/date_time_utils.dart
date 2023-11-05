import 'package:intl/intl.dart';

import '/core/extensions/date_time_extension.dart';

class DateTimeUtils {
  static DateTime todayStart() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0);
  }

  static DateTime todayEnd() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, 23, 59, 59, 999, 999);
  }

  static DateTime monthEnd(int year, int passedMonth) {
    return passedMonth < 12
        ? DateTime(year, passedMonth + 1, 1, 00, 00, 00, -1)
        : DateTime(year + 1, 1, 1, 00, 00, 00, -1);
  }

  static DateTime monthStart(int year, int passedMonth) {
    return DateTime(year, passedMonth, 1);
  }

  static int currentWeekStartToMillisecSinceEpoch() {
    final now = DateTime.now();
    return now.getWeekFirstDayStartInMilliSecondsSinceEpoch;
  }

  static int currentWeekEndToMillisecSinceEpoch() {
    final now = DateTime.now();
    return now.getWeekLastDayStartInMilliSecondsSinceEpoch;
  }

  static List<DateTime> getCurrentWeekDays() {
    final List<DateTime> currentWeekDays = [];
    final now = DateTime.now();
    final currentDay = now.weekday;
    for (int i = currentDay; i >= 1; i--) {
      final preDayDate = now.subtract(Duration(days: i - 1));
      currentWeekDays.add(preDayDate.dayStart);
    }
    for (int i = currentDay + 1; i <= 7; i++) {
      final nextDayDate = now.add(Duration(days: i - currentDay));
      currentWeekDays.add(nextDayDate.dayStart);
    }
    return currentWeekDays;
  }

  static List<String> getCurrentWeekDaysAsStrings() {
    final List<String> currentWeekDays = [];
    final now = DateTime.now();
    final currentDay = now.weekday;
    for (int i = currentDay; i >= 1; i--) {
      final preDayDate = now.subtract(Duration(days: i - 1));
      final preDay = DateFormat('yyyy-MM-dd').format(preDayDate);
      currentWeekDays.add(preDay);
    }
    for (int i = currentDay + 1; i <= 7; i++) {
      final nextDayDate = now.add(Duration(days: i - currentDay));
      final nextDay = DateFormat('yyyy-MM-dd').format(nextDayDate);
      currentWeekDays.add(nextDay);
    }
    return currentWeekDays;
  }
}
