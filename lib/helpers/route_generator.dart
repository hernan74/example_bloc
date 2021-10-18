import 'package:flutter/material.dart';
import 'package:sample/view/home_view.dart';
import 'package:sample/view/login_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      ///LOADING_PAGE
      case 'login':
        return _fadeRoute(LoginView());
      case 'home':
        return _fadeRoute(const HomeView());

      ///RUTA_INEXISTENTE
      default:
        return _fadeRoute(const Text('Error'));
    }
  }

  static PageRoute _fadeRoute(Widget child) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curveAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return FadeTransition(
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
            child: child);
      },
    );
  }
}
