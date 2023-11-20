import 'package:cloud_firestore/cloud_firestore.dart';

extension QuerySnapshotX<T> on QuerySnapshot<T> {
  List<T> toDataModel() {
    return docs.map((e) => e.data()).toList();
  }
}

extension StreamX<T> on Stream<QuerySnapshot<T>> {
  Stream<List<T>> toDataModel() {
    final res = map((event) => event.docs.map((e) => e.data()!).toList());
    return res;
  }
}

extension Stream2X<T> on Stream<DocumentSnapshot<T>> {
  Stream<T> toDataModel() => map((event) => event.data()!);
}
