import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/home/controller/tournament_provider.dart';
import 'package:bluestack_assignment/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme.dart';
import 'locator.dart';
import 'modules/auth/view/loading_screen.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<TournamentProvider>(
          create: (_) => TournamentProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Game.tv',
        theme: kLightThemeData,
        // home: const LoginScreen(),
        initialRoute: LoadingScreen.routeName,
        onGenerateRoute: getRoute,
      ),
    );
  }
}
