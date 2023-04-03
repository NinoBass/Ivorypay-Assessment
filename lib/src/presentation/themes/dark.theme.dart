import 'package:flutter/material.dart';
import 'package:ivorypay/src/presentation/resources/res.dart';

///the dark theme
ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: primary600,
  scaffoldBackgroundColor: Colors.black,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: Typography.englishLike2018.apply(
    fontFamily: 'HelveticaNeue',
    bodyColor: grayScale50,
    displayColor: grayScale50,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: body2.copyWith(color: grayScale700),
    constraints: BoxConstraints.tight(
      const Size.fromHeight(56),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
    focusedBorder: inputBorder(grayScale100),
    border: inputBorder(grayScale700),
    enabledBorder: inputBorder(grayScale700),
    errorBorder: inputBorder(error600),
    focusedErrorBorder: inputBorder(error600),
    isDense: true,
    errorStyle: const TextStyle(fontSize: 0, height: 0),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(white),
      backgroundColor: MaterialStateProperty.all(primary600),
      alignment: Alignment.center,
      textStyle: MaterialStateProperty.all(buttonTypography),
      elevation: MaterialStateProperty.all(0),
      minimumSize: MaterialStateProperty.all(
        const Size.fromHeight(48),
      ),
      shape: MaterialStateProperty.all(
        const StadiumBorder(),
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: white,
    foregroundColor: grayScale600,
    elevation: 0,
    shadowColor: Colors.transparent,
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
