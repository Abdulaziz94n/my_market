import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/features/auth/domain/app_user_model.dart';

class UserController extends Notifier<AppUser?> {
  @override
  build() {
    return DummyData.usersList.first;
  }
}

final userProvider =
    NotifierProvider<UserController, AppUser?>(UserController.new);
