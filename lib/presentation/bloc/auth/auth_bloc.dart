import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/domain/entities/user.dart';
import 'package:proyecto_final/domain/usecases/auth_usecase.dart';
import 'package:proyecto_final/presentation/bloc/auth/auth_event.dart';
import 'package:proyecto_final/presentation/bloc/auth/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
      : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final result = await loginUseCase(event.email, event.password);

        await result.fold(
          (failure) async {
            print('Login failure: ${failure.message}');
            emit(AuthFailure(failure.message));
          },
          (user) async {
            print('Login success, saving user data...');
            final prefs = await SharedPreferences.getInstance();

            // Guardar los datos del usuario
            await prefs.setBool('isLoggedIn', true);
            await prefs.setString('user_id', user.id);
            await prefs.setString('user_email', user.email);
            await prefs.setString('user_name', user.name);

            print('User data saved: ${user.email}'); // Debug log

            // Verificar que los datos se guardaron
            final savedName = prefs.getString('user_name');
            print('Verified saved name: $savedName'); // Debug log

            emit(AuthSuccess(user));
            emit(AuthLoggedIn());
          },
        );
      } catch (e) {
        print('Error in login process: $e'); // Debug log
        emit(AuthFailure('Error inesperado durante el login'));
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await registerUseCase(
        event.email,
        event.password,
        event.name,
      );

      result.fold(
        (failure) {
          emit(AuthFailure(failure.message));
        },
        (user) async {
          await _saveUserData(user);
          emit(AuthSuccess(user));
          emit(AuthLoggedIn());
        },
      );
    });

    on<CheckSessionEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _getUserData();
        if (user != null) {
          emit(AuthSuccess(user));
          emit(AuthLoggedIn());
        } else {
          emit(AuthLoggedOut());
        }
      } catch (e) {
        emit(AuthFailure('Error al verificar la sesión'));
        emit(AuthLoggedOut());
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _clearUserData();
        emit(AuthLoggedOut());
      } catch (e) {
        emit(AuthFailure('Error al cerrar sesión'));
      }
    });
  }
  Future<void> _saveUserData(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('user_id', user.id);
      await prefs.setString('user_email', user.email);
      await prefs.setString('user_name', user.name);
      print("guardo datos de usuario");
    } catch (e) {
      throw Exception('Error al guardar datos de usuario');
    }
  }

  Future<User?> _getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      if (!isLoggedIn) return null;

      final id = prefs.getString('user_id');
      final email = prefs.getString('user_email');
      final name = prefs.getString('user_name');

      if (id != null && email != null && name != null) {
        return User(
          id: id,
          email: email,
          name: name,
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> _clearUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Limpia todas las preferencias
      // O si prefieres eliminar solo las relacionadas con el usuario:
      // await prefs.remove('isLoggedIn');
      // await prefs.remove('user_id');
      // await prefs.remove('user_email');
      // await prefs.remove('user_name');
    } catch (e) {
      throw Exception('Error al limpiar datos de usuario');
    }
  }
}
