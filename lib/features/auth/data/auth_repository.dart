// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:my_market/features/users/domain/users_model.dart';
// import 'package:my_market/main.dart';
// import 'package:my_market/objectbox.g.dart';

// class AuthRepository {
//   AuthRepository();

//   // Method should be called from Servie class only
//   UserModel? login({required String userName, required password}) {
//     final query = objectBox.userBox
//         .query(UserModel_.name
//             .equals(userName)
//             .and(UserModel_.password.equals(password)))
//         .build();
//     final user = query.findFirst();
//     return user;
//   }

//   // TODO: Check
//   external logout();
// }

// final authRepo = Provider<AuthRepository>((ref) {
//   return AuthRepository();
// });
