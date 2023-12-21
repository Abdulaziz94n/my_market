import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/order/data/order_repository.dart';
import 'package:my_market/features/order/data/order_ticket_no_repo.dart';
import 'package:my_market/features/order/domain/order_model.dart';

class OrderService {
  OrderService(this.ref);
  final Ref ref;

  Future<void> submitOrder(CreditOrderModel orderModel) async {
    await ref.read(ordersRepo).addOrderModel(orderModel);
    await ref.read(orderTicketRepo).increaseTicketNo();
  }
}

final orderService = Provider((ref) => OrderService(ref));
