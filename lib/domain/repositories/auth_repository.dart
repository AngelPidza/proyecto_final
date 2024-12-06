import 'package:dartz/dartz.dart';
import 'package:proyecto_final/core/errors/failures.dart';
import 'package:proyecto_final/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> register(
      String email, String password, String name);
}
