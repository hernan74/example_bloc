import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState());

  bool validarCampos(String email, String passWord) {
    bool camposOk = false;
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(email)) {
      camposOk = true;
    }
    if (camposOk) {
      camposOk = false;
      if (passWord.length >= 6) {
        camposOk = true;
      }
    }
    return camposOk;
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is OnValidarCamposAuth) {
      yield* _onValidarCamposAuth(event);
    }
  }

  Stream<AuthState> _onValidarCamposAuth(OnValidarCamposAuth event) async* {
    final validacion = validarCampos(event.email, event.passWord);
    yield state.copyWith(validacionCampos: validacion, error: '', accion: '');
  }
}
