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
    backgroundColor: Colors.white,
  ),
  fontFamily: 'Poppins',
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    fillColor: kTextFieldBGColor,
    filled: true,
  ),
);
