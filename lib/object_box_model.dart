import 'package:my_market/features/users/domain/users_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  late final Box<UserModel> userBox;

  ObjectBox._create(this.store) {
    userBox = Box<UserModel>(store);
    // Add any additional setup code, e.g. build queries.
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "market-app"));
    return ObjectBox._create(store);
  }
}