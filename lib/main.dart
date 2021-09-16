import 'package:bluestack_assignment/routes/routes.dart';
import 'package:flutter/material.dart';

import 'core/theme/theme.dart';
import 'modules/auth/view/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game.tv',
      theme: kLightThemeData,
      // home: const LoginScreen(),
      initialRoute: LoadingScreen.routeName,
      onGenerateRoute: getRoute,
    );
  }
}
