import 'package:dartz/dartz.dart';
import 'package:proyecto_final/core/errors/exceptions.dart';
import 'package:proyecto_final/core/errors/failures.dart';
import 'package:proyecto_final/data/datasources/auth_remote_datasource.dart';
import 'package:proyecto_final/domain/entities/user.dart';
import 'package:proyecto_final/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    // Implementación de conexión a MongoDB.
    try {
      final user = await remoteDatasource.login(email, password);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String email, String password, String name) async {
    try {
      final user = await remoteDatasource.register(email, password, name);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
