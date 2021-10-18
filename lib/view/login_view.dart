import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/auth/auth_bloc.dart';
import 'package:sample/providers/navigator_service.dart';
import 'package:sample/widget/button_widget.dart';
import 'package:sample/widget/textfield_widget.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        _FormularioLogin(),
        const Spacer(),
      ],
    );
  }
}

class _FormularioLogin extends StatelessWidget {
  final emailCtrl = TextEditingController(text: '');
  final passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final estiloSubtitulo = Theme.of(context).textTheme.headline6?.copyWith(
        fontSize: size.height * 4 / 100,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).primaryColor);
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current.validacionCampos,
      listener: (context, state) {
        if (state.validacionCampos) {
          navigationService.navigateRemplaceTo(route: 'home');
        }
        if (state.error != '') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: size.width * 80 / 100,
                  child: Row(
                    children: [
                      Icon(
                        Icons.verified_user,
                        size: size.height * 3.3 / 100,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: size.width * 0.005),
                      Text('Inicie Sesion', style: estiloSubtitulo),
                    ],
                  ),
                ),
                TextfieldWidget(
                  hintText: 'Usuario',
                  controller: emailCtrl,
                  textInputType: TextInputType.text,
                  anchoCampo: size.width * 80 / 100,
                  altoCampo: size.height * 6.5 / 100,
                  labelText: 'Usuario',
                  onChanged: (value) {
                    context.read<AuthBloc>().add(OnValidarCamposAuth(
                        emailCtrl.text.trim(), passCtrl.text.trim()));
                  },
                  textoErrorValidacion: '',
                ),
                SizedBox(height: size.height * 2.2 / 100),
                TextfieldWidget(
                    hintText: 'Correo',
                    textoErrorValidacion: '',
                    controller: passCtrl,
                    textInputType: TextInputType.text,
                    anchoCampo: size.width * 80 / 100,
                    altoCampo: size.height * 6.5 / 100,
                    labelText: 'Clave',
                    onChanged: (value) {
                      context.read<AuthBloc>().add(OnValidarCamposAuth(
                          emailCtrl.text.trim(), passCtrl.text.trim()));
                    }),
                SizedBox(height: size.height * 2.5 / 100),
                ButtonWidget(
                  texto: 'Ingresar',
                  altoMaximo: size.height * 5.5 / 100,
                  anchoMaximo: size.width * 40 / 100,
                  onPressed: (state.validacionCampos)
                      ? () {
                          if (state.validacionCampos) {
                            context.read<AuthBloc>().add(OnValidarDatosAuth(
                                emailCtrl.text.trim(), passCtrl.text.trim()));
                          }
                        }
                      : null,
                  iconoSize: size.height * 2 / 100,
                ),
                if (state.validando)
                  Container(
                    width: size.width * 80 / 100,
                    margin: EdgeInsets.only(top: size.height * 4 / 100),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Iniciando Sesion',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: size.height * 2 / 100),
                        ),
                        SizedBox(width: size.width * 2 / 100),
                        SizedBox(
                          width: size.height * 3 / 100,
                          height: size.height * 3 / 100,
                          child: CircularProgressIndicator(
                            strokeWidth: size.height * 0.3 / 100,
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                    height: (state.validando)
                        ? size.height * 6 / 100
                        : size.height * 10 / 100),
              ],
            ),
          ),
        );
      },
    );
  }
}
