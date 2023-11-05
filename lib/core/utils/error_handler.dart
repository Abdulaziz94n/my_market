// import 'dart:async';
// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

// class AppErrorHandler {
//   AppErrorHandler();
//   static FutureOr<Either<Exception, T>> withEitherFnErrorHandling<T>({
//     required Future<T> Function() future,
//     Type? specificExceptionType,
//   }) async {
//     try {
//       print('inside try block');
//       final result = await future();
//       return Right(result);
//     } on SocketException {
//       print('inside socket exception');
//       return Left(ConnectionException());
//     } on Exception catch (e) {
//       Exception exception = e;
//       if (specificExceptionType != null &&
//           specificExceptionType == e.runtimeType) {
//         if (e is FirebaseAuthException) {
//           exception = SignInException(
//               errorMessage: AuthException.mapFireAuthErrors(e.code));
//         }
//         print('inside generic exception');
//         return Left(exception);
//       } else {
//         if (kDebugMode) {
//           print('Error occurred inside unexpected case: $e');
//         }
//         return Left(UnExpectedException());
//       }
//     }
//   }
// }



//  typedef ErrorHandler<T> = Future<Either<AuthException, T>> Function();

// Future<Either<AuthException, T>> withErrorHandling<T>(
//     ErrorHandler<T> handler) async {
//   try {
//     return await handler();
//   } on FirebaseAuthException catch (e) {
//     return Left(SignInException(
//         errorMessage: SignInException.mapAuthErrors(e.code)));
//   } on SocketException catch (e) {
//     return Left(SignInException(errorMessage: 'Socket Error'));
//   } catch (e) {
//     return Left(SignInException(errorMessage: 'Unknown Error'));
//   }
// }
 
  
//   USAGE

//   Future<Either<AuthException, Unit>> signIn() async {
//   return withErrorHandling(() async {
//     // Code that may throw exceptions
//     return const Right(unit);
//   });
// }
