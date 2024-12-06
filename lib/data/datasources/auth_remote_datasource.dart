import 'package:mongo_dart/mongo_dart.dart';
import 'package:proyecto_final/core/errors/exceptions.dart';
import 'package:proyecto_final/core/utils/api_helper.dart';
import 'package:proyecto_final/data/models/user_dto.dart';
import 'package:proyecto_final/domain/entities/user.dart';

abstract class AuthRemoteDatasource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String name);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiHelper apiHelper;

  AuthRemoteDatasourceImpl(this.apiHelper);

  @override
  Future<User> login(String email, String password) async {
    try {
      await apiHelper.openConnection();
      final usersCollection = apiHelper.getCollection('users');

      final user = await usersCollection.findOne(where.eq('email', email));

      if (user == null) {
        throw AuthException('Usuario no encontrado');
      }

      if (user['password'] != password) {
        throw AuthException('Contraseña incorrecta');
      }

      return UserDto.fromJson(user);
    } on AuthException catch (e) {
      throw AuthException(e.message); // Propaga el mensaje original
    } on ConnectionException {
      throw NetworkException('No se pudo conectar a la base de datos');
    } catch (e) {
      throw ServerException('Error al procesar la solicitud: ${e.toString()}');
    } finally {
      await apiHelper.closeConnection();
    }
  }

  @override
  Future<User> register(String email, String password, String name) async {
    try {
      await apiHelper.openConnection();
      final collection = apiHelper.getCollection('users');

      final existingUser = await collection.findOne(where.eq('email', email));
      if (existingUser != null) {
        throw AuthException('El correo electrónico ya está registrado');
      }

      final newUser = {
        'email': email,
        'password': password,
        'name': name,
        'createdAt': DateTime.now(),
      };

      final result = await collection.insertOne(newUser);

      if (!result.isSuccess) {
        throw ServerException('Error al crear el usuario');
      }

      // Convertir el ObjectId a String antes de crear el UserDto
      final savedUser = newUser;
      savedUser['_id'] = result.id.toHexString();

      return UserDto.fromJson(savedUser);
    } on AuthException {
      rethrow;
    } on ConnectionException {
      throw NetworkException('No se pudo conectar a la base de datos');
    } catch (e) {
      throw ServerException('Error al procesar la solicitud: ${e.toString()}');
    } finally {
      await apiHelper.closeConnection();
    }
  }
}
