import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final NavigationService navigationService = NavigationService();

class NavigationService {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static void showSnackbarMessage(String message) {
    ScaffoldMessenger.of(NavigationService.navigationKey.currentContext!)
      ..hideCurrentSnackBar
      ..showSnackBar(SnackBar(
        content: Text(message),
      ));
  }

  Future<dynamic> push(String name, {Object? arguments}) async {
    return navigationKey.currentState?.pushNamed<dynamic>(
      name,
      arguments: arguments,
    );
  }

  Future<dynamic> pushRoute(Route<dynamic> route) async {
    return navigationKey.currentState?.push(route);
  }

  Future<dynamic> pushReplacement(String name, {Object? arguments}) async {
    return navigationKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
      name,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> pop([dynamic result]) async {
    return navigationKey.currentState?.pop<dynamic>(result);
  }

  bool canPop() {
    return navigationKey.currentState?.canPop() == true;
  }
}
