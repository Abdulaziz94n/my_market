import 'package:flutter/material.dart';

extension ListExtension<T> on List<T> {
  List<DropdownMenuItem<T>> toDropdownItems(
      {required Widget Function(T item) childBuilder}) {
    return map((e) => DropdownMenuItem<T>(value: e, child: childBuilder(e)))
        .toList();
  }

  List<PopupMenuItem<T>> toPopupItems(
      {required Widget Function(T item) childBuilder}) {
    return map((e) => PopupMenuItem<T>(value: e, child: childBuilder(e)))
        .toList();
  }

  void sortBy<R extends Comparable>(R Function(T) selector,
      {bool descending = false}) {
    if (descending) {
      sort((a, b) => selector(b).compareTo(selector(a)));
    } else {
      sort((a, b) => selector(a).compareTo(selector(b)));
    }
  }

  List<T> filterByString(String query, String Function(T item) field) {
    final res = where((element) {
      return field(element).toLowerCase().contains(query.toLowerCase());
    }).toList();
    return res;
  }

  List<T> filterByInt(String query, int Function(T item) field) {
    final res =
        where((element) => field(element).toString().contains(query)).toList();
    return res;
  }

  List<T> operator *(int multiplier) {
    List<T> result = [];
    for (int i = 0; i < multiplier; i++) {
      result.addAll(this);
    }
    return result;
  }

  List<R> zip2Lists<R, B>(
    List<B> otherList,
    R Function(T, B) combiner,
  ) {
    final length =
        this.length < otherList.length ? this.length : otherList.length;
    return List<R>.generate(
        length, (index) => combiner(this[index], otherList[index]));
  }
}
