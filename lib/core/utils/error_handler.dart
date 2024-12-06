import 'package:proyecto_final/core/errors/exceptions.dart';
import 'package:proyecto_final/core/errors/failures.dart';

class ErrorHandler {
  static String mapExceptionToMessage(Exception exception) {
    if (exception is AuthException) {
      return exception.message;
    } else if (exception is NetworkException) {
      return 'Error de conexión: ${exception.message}';
    } else if (exception is ServerException) {
      return 'Error del servidor: ${exception.message}';
    }
    return 'Error inesperado: ${exception.toString()}';
  }

  static Failure mapExceptionToFailure(Exception exception) {
    if (exception is AuthException) {
      return AuthFailure(exception.message);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    } else if (exception is ServerException) {
      return ServerFailure(exception.message);
    }
    return const ServerFailure('Error inesperado');
  }
}
