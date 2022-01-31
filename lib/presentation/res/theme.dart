import 'package:flutter/material.dart';
import 'package:flutter_widgetkit_sample/presentation/res/colors.dart';

ThemeData get appTheme {
  final base = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  return base.copyWith(
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backgroundColor: primaryColor,
      iconTheme: base.iconTheme.copyWith(color: Colors.black),
    ),
    dialogBackgroundColor: whiteColor,
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(0.4),
    ),
    scaffoldBackgroundColor: whiteColor,
  );
}
