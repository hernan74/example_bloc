part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class OnValidarDatosAuth extends AuthEvent {
  final String email;
  final String passWord;

  OnValidarDatosAuth(this.email, this.passWord);
}

class OnValidarCamposAuth extends AuthEvent {
  final String email;
  final String passWord;

  OnValidarCamposAuth(this.email, this.passWord);
}

class OnValidarDatosGuardadosAuth extends AuthEvent {
  OnValidarDatosGuardadosAuth();
}

class OnLogoutAuth extends AuthEvent {
  OnLogoutAuth();
}
