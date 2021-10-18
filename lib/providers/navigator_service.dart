import 'package:flutter/material.dart';

///Clase que almacena el global key de la navegacion.
///Tambien posee las acciones para navegar a otra vista y cerrar.
class _NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigateTo({required String routeName, Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future navigateRemplaceTo({required String route, Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(route, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}

final navigationService = _NavigationService();
