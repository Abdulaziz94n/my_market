sealed class AppException implements Exception {
  AppException({required this.message});
  final String message;

  @override
  String toString() => message;
}

class ConnectionException extends AppException {
  ConnectionException() : super(message: 'Connection Error');
}

class UnexpectedException extends AppException {
  UnexpectedException() : super(message: 'unexpected error');
}

class CustomException extends AppException {
  CustomException({required super.message});
}
