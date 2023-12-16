import 'package:my_market/features/users/domain/users_model.dart';
import 'package:my_market/main.dart';
import 'package:objectbox/objectbox.dart';

class UsersRepository {
  UserModel? fetchUser(int id) {
    final user = objectBox.userBox.get(id);
    return user;
  }

  void addUser(UserModel user) {
    objectBox.userBox.put(user);
  }

  void updateUser(UserModel newUser) {
    objectBox.userBox.put(newUser, mode: PutMode.update);
  }

  void deleteUser(int id) {
    objectBox.userBox.remove(id);
  }
}
