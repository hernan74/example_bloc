import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Widget child;

  const LoginPage({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              width: size.width * 0.23,
              constraints: const BoxConstraints(minWidth: 400, minHeight: 400),
              child: child),
        ),
      ),
    );
  }
}
