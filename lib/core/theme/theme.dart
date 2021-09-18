import 'package:flutter/material.dart';

ThemeData kLightThemeData = ThemeData(
  // primarySwatch: const MaterialColor(0xff365967, {
  //   50: Color(0xff365967),
  //   100: Color(0xff365967),
  //   200: Color(0xff365967),
  //   300: Color(0xff365967),
  //   400: Color(0xff365967),
  //   500: Color(0xff365967),
  //   600: Color(0xff365967),
  //   700: Color(0xff365967),
  //   800: Color(0xff365967),
  //   900: Color(0xff365967)
  // }),

  primaryColor: const Color(0xfff7892b),

  // brightness: Brightness.light,
  // primaryColor: Colors.white,
  // accentColor: const Color(0xff4b71fe),

  // colorScheme: const ColorScheme.light(
  //   secondary: Color(0xff4b71fe),
  //   // brightness: Brightness.dark,
  //   background: Colors.white,
  // ),
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Color(0xfff7892b)),
  // // buttonColor: goldYellow,
  // // splashColor: Colors.black,
  // // accentColor: kThemeLightBlue, //Color for Label in Text Field

  // colorScheme: const ColorScheme.light(
  //     primary: kThemePurpleBlue, secondary: kThemePurpleBlue),
  // // shadowColor: Colors.blueGrey,
  // // focusColor: Colors.white,
  // // primaryTextTheme: TextTheme(
  // //   headline6: TextStyle(color: Colors.white),
  // //   // bodyText1: TextStyle(color: kBodyTextColor),
  // // ),

  // // cardColor: kDarkBluesyGreen,
  // // dialogBackgroundColor: kLightBluesyGreen,

  // primaryTextTheme:
  //     const TextTheme(headline6: TextStyle(color: kThemePurpleBlue)),

  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,

    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),

    //  style: TextStyle(
    //         fontWeight: FontWeight.w600,
    //         fontSize: 20,
    //       ),

    backgroundColor: Colors.white,
    // // textTheme: TextTheme(headline6: TextStyle(color: kThemeDarkBlue)),
    // // textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
    // iconTheme: IconThemeData(color: kThemePurpleBlue),

    // titleTextStyle: TextStyle(
    //     color: kThemePurpleBlue, fontSize: 18, fontWeight: FontWeight.w500),
    // color: Colors.cyan,
    // brightness: Brightness.dark,

    // toolbarTextStyle: TextStyle(color: kThemeLightBlue),
    // systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.light),
    // backgroundColor: Colors.white,
  ),
  // scaffoldBackgroundColor: Colors.white,

  fontFamily: 'Poppins',

  // textSelectionTheme:
  //     const TextSelectionThemeData(cursorColor: kThemeLightBlue),
  // inputDecorationTheme: InputDecorationTheme(
  //   hintStyle: TextStyle(color: kThemeSeconderyTextColor.withOpacity(0.3)),
  //   suffixStyle: const TextStyle(color: kThemeSeconderyTextColor),
  //   // focusedBorder: UnderlineInputBorder(
  //   //   borderSide: BorderSide(color: Colors.white),
  //   // ),
  //   // border: UnderlineInputBorder(
  //   //   borderSide: BorderSide(color: Colors.white),
  //   // ),
  //   // enabledBorder: UnderlineInputBorder(
  //   //   borderSide: BorderSide(
  //   //     color: Colors.white,
  //   //   ),
  //   // ),
  // ),

  // // buttonTheme: ButtonThemeData(buttonColor: kThemePurpleBlue),

  // dividerTheme: DividerThemeData(
  //   space: 1,
  //   color: const Color(0xff6B778C).withOpacity(0.2),
  //   thickness: 1,
  // ),

  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     // primary: kThemeLightBlue,
  //     primary: kThemePurpleBlue,
  //   ),
  // ),

  // outlinedButtonTheme: OutlinedButtonThemeData(
  //     style: OutlinedButton.styleFrom(
  //   side: const BorderSide(color: kThemePurpleBlue),
  //   primary: kThemePurpleBlue,
  // )),
  // textButtonTheme: TextButtonThemeData(
  //   style: TextButton.styleFrom(
  //     primary: kThemePurpleBlue,
  //   ),
  // ),
  // textTheme: const TextTheme(
  //   headline1: TextStyle(color: kThemeLightBlue),
  //   button: TextStyle(color: Colors.black),
  // ),
);
