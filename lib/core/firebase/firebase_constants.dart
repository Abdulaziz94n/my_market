// import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreConsts {
//   static final _firestore = FirebaseFirestore.instance;

//   static CollectionReference usersCol = _firestore.collection('users');
}

// class FireStorageConsts {
//   static const profilePicRef = '/users/profile';
// }

class FireAuthErrorCodes {
  static const userDisabledCode = 'user-disabled';
  static const invalidEmailCode = 'invalid-email';
  static const userNotFoundCode = 'user-not-found';
  static const loginWrongPasswordCode = 'wrong-password';
  static const emailAlreadyInUseCode = 'email-already-in-use';
  static const weakPassword = 'weak-password';
  static const invalidVerificationCode = 'invalid-verification-code';
  static const tooManyRequestsCode = 'too-many-requests';
  static const requiresRecentLoginCode = 'requires-recent-login';
  static const networkRequestFailed = 'network-request-failed';
}

class FirebaseExceptionCodes {
  static const serviceUnavailableCode = 'unavailable'; //cloud-firestore error
  // //The service is currently unavailable. This is a most likely a transient condition and may be corrected by retrying with a backoff.
}
