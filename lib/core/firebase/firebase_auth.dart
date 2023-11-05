// import './firebase_constants.dart';

// // Future<void> register({
// //   required String email,
// //   required String password,
// //   required String userName,
// //   required UserRole role,
// //   required String phone,
// // }) async {
// //   try {
// //     // isLoading = true;
// //     // Manage State Update
// //     final userCredential = await _auth.createUserWithEmailAndPassword(
// //         email: email, password: password);
// //     userCredential.user!.updateDisplayName(userName);
// //     userCredential.user!.updateEmail(email);
// //     final createUser = AppUser(
// //       id: _auth.currentUser!.uid,
// //       userName: userName,
// //       companyId: companyId,
// //       role: role,
// //       phone: phone,
// //       email: email,
// //     );
// //     await FirestoreConsts.usersCol
// //         .doc(userCredential.user?.uid)
// //         .set(createUser.toMap());
// //     userCredential.user?.uid;
// //     // isLoading = false;
// //     // Manage State Update
// //   } on FirebaseAuthException catch (e) {
// //     // isLoading = false;
// //     // update();
// //     // Get.showSnackbar(GetSnackBar(
// //     //   messageText: Text(AuthException.mapFireAuthErrors(e.code)),
// //     //   duration: const Duration(seconds: 2),
// //     // ));
// //   } catch (e) {
// //     // isLoading = false;
// //     // update();
// //     // Get.showSnackbar(GetSnackBar(
// //     //   messageText: Text(e.toString()),
// //     //   duration: const Duration(seconds: 2),
// //     // ));
// //   }
// // }

// // --------------------------------------------------------

// Future<void> signIn({
//   required String email,
//   required String password,
// }) async {
//   try {
//     // isLoading = true;
//     // update();
//     final authRes = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);
//   } on SocketException {
//     // Get.showSnackbar(GetSnackBar(
//     //   messageText: Text(connectionError.tr.capitalizeFirstOfEach),
//     //   duration: const Duration(seconds: 2),
//     // ));
//   } on FirebaseAuthException catch (e) {
//     // isLoading = false;
//     // update();
//     // print(e.code);
//     // Get.showSnackbar(GetSnackBar(
//     //   messageText: Text(AuthException.mapFireAuthErrors(e.code)),
//     //   duration: const Duration(seconds: 2),
//     // ));
//   } catch (e) {
//     // isLoading = false;
//     // update();
//     // Get.showSnackbar(GetSnackBar(
//     //   messageText: Text(e.toString()),
//     //   duration: const Duration(seconds: 2),
//     // ));
//   }
// }

// // --------------------------------------------------

// // Future<void> resetPassword(String email) async {
// //   try {
// //     await _auth.sendPasswordResetEmail(email: email);
// //     // Get.showSnackbar(GetSnackBar(
// //     //   messageText: Text(success.tr.capitalizeFirstOfEach),
// //     //   duration: const Duration(seconds: 2),
// //     // ));
// //   } catch (e) {
// //     // Get.showSnackbar(GetSnackBar(
// //     //   messageText: Text(e.toString()),
// //     //   duration: const Duration(seconds: 2),
// //     // ));
// //   }
// // }

// // Future<void> changePassword(String newPassword, String currentPassowrd) async {
// //   AuthCredential credential = EmailAuthProvider.credential(
// //     email: _auth.currentUser!.email!,
// //     password: currentPassowrd, // currentPassword is the user's current password
// //   );
// //   try {
// //     // isLoading = true;
// //     // update();
// //     await _auth.currentUser!.reauthenticateWithCredential(credential);
// //     await _auth.currentUser!.updatePassword(newPassword);
// //     // isLoading = false;
// //     // update();
// //     // Get.back();
// //     // Get.showSnackbar(GetSnackBar(
// //     //   messageText: Text(succChangPassword.tr.capitalizeFirstOfEach),
// //     //   duration: const Duration(seconds: 2),
// //     // ));
// //   } on FirebaseAuthException catch (e) {
// //     // TODO: Handle Other FirebaseAuthExceptions here
// //     if (e.code == FireAuthErrorCodes.requiresRecentLoginCode) {
// //       try {
// //         await _auth.currentUser!.reauthenticateWithCredential(credential);
// //         await _auth.currentUser!.updatePassword(newPassword);
// //       } catch (e) {
// //         // isLoading = false;
// //         // update();
// //         // Get.showSnackbar(GetSnackBar(
// //         //   messageText: Text(
// //         //     error.tr.capitalizeFirstOfEach,
// //         //   ),
// //         //   duration: const Duration(seconds: 2),
// //         // ));
// //         return;
// //       }
// //       // isLoading = false;
// //       // update();
// //       // Get.showSnackbar(GetSnackBar(
// //       //   messageText: Text(
// //       //     succChangPassword.tr.capitalizeFirstOfEach,
// //       //   ),
// //       //   duration: const Duration(seconds: 2),
// //       // ));
// //     } else {
// //       // isLoading = false;
// //       // update();
// //       // Get.showSnackbar(
// //       //   GetSnackBar(
// //       //     messageText: Text(AuthException.mapFireAuthErrors(e.code)),
// //       //     duration: const Duration(seconds: 2),
// //       //   ),
// //       // );
// //     }
// //   } catch (e) {
// //     // isLoading = false;
// //     // update();
// //     // Get.showSnackbar(GetSnackBar(
// //     //   messageText: Text(e.toString()),
// //     //   duration: const Duration(seconds: 2),
// //     // ));
// //   }
// // }

// // ----------------------------------------------------------

// Future<void> signOut() async {
//   try {
//     print('SIGN OUT FIRED');
//     await _auth.signOut();
//   } catch (e) {
//     //TODO: refactor
//     // Get.dialog(const Text('Signout Error'));
//   }
// }

/**
 * 
 * 
  Future signInWithGoogle() async {
    try {
      //  final googleSignIn = GoogleSignIn();
      // TODO : TRY TO GET USER PHONE NUMBER , GENDER AND COUNTRY FROM GOOGLE ACCOUNT
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final customerDocRef =
          FirestoreConsts.customersCol.doc(userCredential.user?.uid);
      final customerDoc = await customerDocRef.get();
      if (customerDoc.exists) {
        print('Doc Exists no write to firestore');
        return;
      } else {
        final createdCustomer = Customer(
          id: _auth.currentUser!.uid,
          registeredAt: DateTime.now(),
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          provider: RegistrationProvider.google,
          country: Country.undefined,
          gender: Gender.undefined,
          phone: '',
        );
        await customerDocRef.set(createdCustomer.toMap());
      }
    } catch (e) {
      print(e);
    }
  }
 */