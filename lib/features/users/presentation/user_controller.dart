import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/features/users/domain/users_model.dart';

class UserController extends Notifier<UserModel?> {
  @override
  build() {
    return null;
  }

  setUser(UserModel user) {
    state = user;
  }

  nullifyUser() {
    state = null;
  }
}

final userProvider =
    NotifierProvider<UserController, UserModel?>(UserController.new);
