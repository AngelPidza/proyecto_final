import 'package:dartz/dartz.dart';
import 'package:proyecto_final/core/errors/failures.dart';
import 'package:proyecto_final/domain/entities/user.dart';
import 'package:proyecto_final/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, User>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, User>> call(
      String email, String password, String name) async {
    return await repository.register(email, password, name);
  }
}
