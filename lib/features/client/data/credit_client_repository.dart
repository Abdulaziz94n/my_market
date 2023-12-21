import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/features/client/domain/credit_client_model.dart';
import 'package:my_market/main.dart';
import 'package:my_market/objectbox.g.dart';

class CreditClientRepository {
  CreditClientRepository();

  Box<CreditClientModel> get clientBox => objectBox.creditClientBox;

  void addClient(CreditClientModel client) {
    clientBox.put(client);
    print('DOne');
  }

  List<CreditClientModel> getAllClients() {
    final clients = clientBox.getAll();
    return clients;
  }

  CreditClientModel getClient(int dbId) {
    final client = clientBox.get(dbId);
    if (client != null) {
      return client;
    } else {
      throw CustomException(message: 'Client not found');
    }
  }

  void deleteClient(int dbId) {
    final result = clientBox.remove(dbId);
    print('Item is Delete? $result');
    if (result) {
      return;
    } else {
      throw CustomException(message: 'Error Deleting Client');
    }
  }
}

final creditClientRepo = Provider<CreditClientRepository>((ref) {
  return CreditClientRepository();
});
