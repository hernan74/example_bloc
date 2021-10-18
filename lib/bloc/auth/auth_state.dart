part of 'auth_bloc.dart';

@immutable
class AuthState {
  final String email;
  final bool
      validando; // Este valor lo Utilizao para saber cuando se encuentra Validando Informacion
  final bool validacionDatos;
  final bool validacionCampos;
  final String error;
  final String accion;

  const AuthState(
      {this.email = '',
      this.validando = false,
      this.validacionDatos = false,
      this.validacionCampos = false,
      this.error = '',
      this.accion = ''});

  AuthState copyWith(
          {String? email,
          String? passWord,
          bool? validando,
          bool? validacionDatos,
          bool? validacionCampos,
          String? error,
          String? accion}) =>
      AuthState(
          email: email ?? this.email,
          validando: validando ?? this.validando,
          validacionDatos: validacionDatos ?? this.validacionDatos,
          validacionCampos: validacionCampos ?? this.validacionCampos,
          error: error ?? this.error,
          accion: accion ?? this.accion);

  AuthState initState() => const AuthState();
}
