import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

//the light theme
ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: primary600,
  colorScheme: const ColorScheme.light(
    primary: primary600,
    error: error600,
    secondary: secondary600,
    tertiary: grayScale600,
  ),
  scaffoldBackgroundColor: white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: Typography.englishLike2018.apply(
    fontFamily: 'HelveticaNeue',
    bodyColor: grayScale600,
    displayColor: grayScale600,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: body2.copyWith(color: grayScale300),
    fillColor: grayScale50,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    focusedBorder: inputBorder(primary600),
    border: inputBorder(grayScale50),
    enabledBorder: inputBorder(grayScale50),
    disabledBorder: inputBorder(grayScale200),
    errorBorder: inputBorder(error600),
    focusedErrorBorder: inputBorder(error600),
    isDense: true,
    errorStyle: const TextStyle(fontSize: 0, height: 0),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(white),
      alignment: Alignment.center,
      textStyle: MaterialStateProperty.all(buttonTypography),
      elevation: MaterialStateProperty.all(0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    foregroundColor: grayScale600,
    elevation: 0,
    shadowColor: Colors.transparent,
    //For status bar, sets text and icon color to black
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  iconTheme: const IconThemeData(
    size: 24,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    backgroundColor: grayScale50,
    selectedItemColor: primary600,
    unselectedItemColor: grayScale600,
    showUnselectedLabels: true,
    selectedIconTheme: const IconThemeData(
      color: primary600,
      size: 24,
    ),
    unselectedIconTheme: const IconThemeData(
      color: grayScale600,
      size: 24,
    ),
    selectedLabelStyle: caption.copyWith(
      color: primary600,
      fontWeight: mediumText,
    ),
    unselectedLabelStyle: caption.copyWith(
      color: grayScale600,
      fontWeight: mediumText,
    ),
  ),
);
