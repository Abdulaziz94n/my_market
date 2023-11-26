import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/core/extensions/string_extension.dart';

String _ticketFieldName = 'ticketNo';
String _ticketsCollectionName = 'tickets';
String _localTicketsDocId = 'localTicket';

class OrderTicketRepository {
  OrderTicketRepository(this.firestore);
  final FirebaseFirestore firestore;

  int get startinglocalTicketNo {
    final now = DateTime.now();
    final year = now.year.toString().substring(2);
    final res = '${year}0000001';
    return res.tryParseInt!;
  }

  Future<int> fetchTicketNo() async {
    try {
      final doc = await _docRef.get();
      if (!doc.exists) {
        _docRef.set({_ticketFieldName: startinglocalTicketNo});
        return startinglocalTicketNo;
      } else {
        return doc.get(_ticketFieldName);
      }
    } catch (e) {
      throw CustomException(message: 'Something went wrong');
    }
  }

  Future<void> increaseTicketNo() async {
    try {
      await _docRef.update({_ticketFieldName: FieldValue.increment(1)});
    } catch (e) {
      throw CustomException(message: 'Error increasing Ticket no $e');
    }
  }

  DocumentReference get _docRef =>
      firestore.collection(_ticketsCollectionName).doc(_localTicketsDocId);
}

final orderTicketRepo = Provider<OrderTicketRepository>((ref) {
  return OrderTicketRepository(FirebaseFirestore.instance);
});

final fetchTicketNo = AutoDisposeFutureProvider<int>((ref) async {
  final repo = ref.read(orderTicketRepo);
  print('object');
  return repo.fetchTicketNo();
});
