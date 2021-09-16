import 'package:bluestack_assignment/modules/auth/view/login_screen.dart';
import 'package:bluestack_assignment/modules/home/view/home_screen.dart';
import 'package:bluestack_assignment/modules/auth/view/loading_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoadingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoadingScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());

    default:
      return null;
  }
}
