import 'package:bluestack_assignment/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

ThemeData kLightThemeData = ThemeData(
  primaryColor: kPrimaryColor,

  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: kPrimaryColor),

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
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    fillColor: kTextFieldBGColor,
    filled: true,

    // focusedBorder: UnderlineInputBorder(
    //   borderSide: BorderSide(color: Colors.white),
    // ),
    // border: UnderlineInputBorder(
    //   borderSide: BorderSide(color: Colors.white),
    // ),
    // enabledBorder: UnderlineInputBorder(
    //   borderSide: BorderSide(
    //     color: Colors.white,
    //   ),
    // ),
  ),

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
