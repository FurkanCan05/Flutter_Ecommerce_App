import 'package:bitirme_projesi/data/data/colors.dart';
import 'package:flutter/material.dart';

final customTheme = ThemeData(
  scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,

  colorScheme: ThemeData().colorScheme.copyWith(
        primary: CustomColors.textColor,
      ),

  //Appbar
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 80.0,
  ),

  //Textfields
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(15.0),
    hintStyle: const TextStyle(color: CustomColors.darkGrey),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: CustomColors.darkGrey,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: CustomColors.darkGrey,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),

  //Elevated Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColors.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
  ),

  //Text Button
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: const Size(40, 40),
      shape: const CircleBorder(),
      side: const BorderSide(color: CustomColors.darkGrey, width: 2),
    ),
  ),

  //Texts
  textTheme: const TextTheme(
    headline5: TextStyle(
      fontFamily: "Nunito_Regular",
      color: CustomColors.textColor,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      fontFamily: "Nunito_Bold",
      color: CustomColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 22.0,
    ),
    subtitle2: TextStyle(
      fontFamily: "Nunito_Bold",
      color: CustomColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),
  ),

  //Card
  cardTheme: CardTheme(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    color: CustomColors.scaffoldBackgroundColor,
  ),
);
