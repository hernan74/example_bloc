import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sample/bloc/auth/auth_bloc.dart';
import 'package:sample/helpers/route_generator.dart';
import 'package:sample/providers/navigator_service.dart';
import 'package:sample/view/login_page.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (_) => AuthBloc())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Example',
        initialRoute: 'login',
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        builder: (_, child) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return LoginPage(child: child!);
            },
          );
        });
  }
}
