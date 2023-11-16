import 'package:flutter/material.dart';

// Color palette
const Color mainColor = Color.fromRGBO(200, 79, 184, 1);
const Color darkerMainColor = Color.fromRGBO(131, 38, 118, 1);
const Color darktethememain = Color.fromARGB(255, 57, 20, 52);
const Color lighterMainColor = Color.fromRGBO(140, 90, 207, 1);
const Color lightestPurple = Color.fromRGBO(244, 182, 236, 0.474);
const Color accentColorOrange = Color.fromRGBO(45, 241, 255, 1);
const Color accentColorAqua = Color.fromARGB(255, 150, 198, 215);
const Color accentColorPurle = Color.fromRGBO(143, 157, 255, 1);
const Color darkGrey = Color.fromRGBO(89, 88, 85, 1);
const Color lightGrey = Color.fromRGBO(164, 162, 156, 1);
const Color backgroundDarkColor = Color.fromRGBO(20, 20, 20, 1);
const Color backgroundLightColor = Color.fromRGBO(253, 253, 253, 1);

ThemeData mainTheme = ThemeData(
  primaryColor: mainColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: backgroundLightColor,
  textTheme: const TextTheme().apply(bodyColor: backgroundDarkColor),
  switchTheme:
      SwitchThemeData(thumbColor: MaterialStateProperty.all(accentColorOrange)),
  listTileTheme: const ListTileThemeData(iconColor: accentColorOrange),
  appBarTheme: const AppBarTheme(
    backgroundColor: mainColor,
  ),
  iconTheme: const IconThemeData(color: lightGrey),
);

ThemeData darkTheme = ThemeData(
  primaryColor: darktethememain,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: backgroundDarkColor,
  textTheme: const TextTheme().apply(bodyColor: backgroundLightColor),
  switchTheme:
      SwitchThemeData(thumbColor: MaterialStateProperty.all(accentColorAqua)),
  listTileTheme: const ListTileThemeData(iconColor: accentColorAqua),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkerMainColor,
  ),
  iconTheme: const IconThemeData(color: darkGrey),
);
