import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    if (navigatorKey.currentState == null) {
      print(
          'Navigation state is null. Make sure navigatorKey is properly connected to MaterialApp');
      return Future.value();
    }
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateToReplacement(String routeName) {
    if (navigatorKey.currentState == null) {
      print(
          'Navigation state is null. Make sure navigatorKey is properly connected to MaterialApp');
      return Future.value();
    }
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void goBack() {
    if (navigatorKey.currentState == null) {
      print(
          'Navigation state is null. Make sure navigatorKey is properly connected to MaterialApp');
      return;
    }
    navigatorKey.currentState!.pop();
  }
}
