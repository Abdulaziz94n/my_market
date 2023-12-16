import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/exceptions/app_exceptions.dart';
import 'package:my_market/features/users/domain/users_model.dart';
import 'package:my_market/features/users/presentation/user_controller.dart';
import 'package:my_market/main.dart';
import 'package:my_market/objectbox.g.dart';

class AuthController extends Notifier<UserModel?> {
  @override
  build() {
    return null;
  }

  void login({required String userName, required password}) {
    final query = objectBox.userBox
        .query(UserModel_.name
            .equals(userName)
            .and(UserModel_.password.equals(password)))
        .build();
    final user = query.findFirst();
    print(user);
    if (user == null) {
      throw CustomException(message: 'No User Found With Provided Credentials');
    }
    ref.read(userProvider.notifier).setUser(user);
  }

  void logout() {
    state = null;
    ref.read(userProvider.notifier).nullifyUser();
  }
}

final authController =
    NotifierProvider<AuthController, UserModel?>(AuthController.new);
