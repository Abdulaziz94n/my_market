import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/extensions/firestore_extension.dart';
import 'package:my_market/features/order/domain/order_model.dart';

class OrdersRepository {
  OrdersRepository(this.firestore);
  final FirebaseFirestore firestore;

  CollectionReference<CreditOrderModel> get _collectionRef {
    return firestore.collection('orders').withConverter<CreditOrderModel>(
          fromFirestore: (data, options) {
            return CreditOrderModel.fromMap(data.data()!);
          },
          toFirestore: (data, options) => data.toMap(),
        );
  }

  Stream<List<CreditOrderModel>> watchOrderModelList() {
    return _collectionRef.snapshots().toDataModel();
  }

  Stream<CreditOrderModel> watchOrderModel(String id) {
    return _collectionRef.doc(id).snapshots().toDataModel();
  }

  // Call this method only from Service class
  Future<void> addOrderModel(CreditOrderModel data) async {
    try {
      await _collectionRef.doc(data.orderId).set(data);
    } catch (e) {
      throw CustomException(message: 'Error Adding OrderModel');
    }
  }

  Future<void> editOrderModel(String id, CreditOrderModel newData) async {
    try {
      await _collectionRef.doc(id).update(newData.toMap());
    } catch (e) {
      throw CustomException(message: 'Error Editing OrderModel');
    }
  }

  Future<void> deleteOrderModel(String id) async {
    try {
      await _collectionRef.doc(id).delete();
    } catch (e) {
      throw CustomException(message: 'Error Deleting OrderModel');
    }
  }
}

final ordersRepo = Provider<OrdersRepository>((ref) {
  return OrdersRepository(FirebaseFirestore.instance);
});
