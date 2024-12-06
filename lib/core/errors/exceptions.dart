abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class ServerException extends AppException {
  ServerException([super.message = 'Server Error']);
}

class AuthException extends AppException {
  AuthException([super.message = 'Authentication Error']);
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Network Error']);
}

class DatabaseException extends AppException {
  DatabaseException(super.message);
}
