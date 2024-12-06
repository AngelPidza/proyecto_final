abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(
    this.email,
    this.password,
  );
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterEvent(this.email, this.password, this.name);
}

class CheckSessionEvent extends AuthEvent {} // Verificar sesión al inicio

class LogoutEvent extends AuthEvent {}
