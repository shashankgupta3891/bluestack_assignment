import 'package:bluestack_assignment/core/service/internal_storage_service.dart';
import 'package:bluestack_assignment/modules/auth/controller/auth_provider.dart';
import 'package:bluestack_assignment/modules/home/controller/home_provider.dart';
import 'package:bluestack_assignment/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'common.dart';

import 'core/theme/theme.dart';

import 'modules/auth/view/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InternalStorage().init();
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
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Game.tv',
        theme: kLightThemeData,
        localizationsDelegates: const [
          // App specific localization delegate
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'IN'), // English
          Locale('ja', 'JP'), // Japanese
        ],
        initialRoute: LoadingScreen.routeName,
        onGenerateRoute: getRoute,
      ),
    );
  }
}
