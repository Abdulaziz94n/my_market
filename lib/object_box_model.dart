import 'dart:developer';

import 'package:my_market/features/client/domain/company_client_model.dart';
import 'package:my_market/features/client/domain/credit_client_model.dart';
import 'package:my_market/features/order/domain/order_model.dart';
import 'package:my_market/features/product/domain/product_entity.dart';
import 'package:my_market/features/users/domain/user_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  late final Store store;
  late final Box<UserModel> userBox;
  late final Box<CreditClientModel> creditClientBox;
  late final Box<CompanyClientModel> companyClientBox;
  late final Box<CreditOrderModel> ordersBox;
  late final Box<ProductEntity> productBox;

  ObjectBox._create(this.store) {
    userBox = Box<UserModel>(store);
    creditClientBox = Box<CreditClientModel>(store);
    companyClientBox = Box<CompanyClientModel>(store);
    productBox = Box<ProductEntity>(store);
    ordersBox = Box<CreditOrderModel>(store);
    log('ALL REMOVED');
    // Add any additional setup code, e.g. build queries.
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "market-app"));
    return ObjectBox._create(store);
  }
}
