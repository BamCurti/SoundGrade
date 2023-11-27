import 'package:flutter/material.dart';

// Color palette
const Color mainColor = Color.fromRGBO(103, 28, 112, 1);
const Color darkerMainColor = Color.fromRGBO(78, 22, 70, 1);
const Color darktethememain = Color.fromARGB(255, 184, 195, 247);
const Color lighterMainColor = Color.fromRGBO(140, 90, 207, 1);
const Color lightestPurple = Color.fromRGBO(244, 182, 236, 0.474);
const Color accentColorOrange = Color.fromRGBO(45, 241, 255, 1);
const Color accentColorAqua = Color.fromARGB(255, 150, 198, 215);
const Color accentColorPurle = Color.fromRGBO(143, 157, 255, 1);
const Color darkGrey = Color.fromRGBO(89, 88, 85, 1);
const Color lightGrey = Color.fromRGBO(121, 116, 121, 1);
const Color backgroundDarkColor = Color.fromRGBO(47, 44, 47, 1);
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
  cardTheme: const CardTheme(color: backgroundLightColor),
  iconTheme: const IconThemeData(color: lightGrey),
);

ThemeData darkTheme = ThemeData(
  primaryColor: darkerMainColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: backgroundDarkColor,
  textTheme: const TextTheme().apply(bodyColor: Colors.grey),
  switchTheme:
      SwitchThemeData(thumbColor: MaterialStateProperty.all(accentColorAqua)),
  listTileTheme: const ListTileThemeData(iconColor: Colors.grey),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkerMainColor,
  ),
  cardTheme: const CardTheme(color: lightGrey),
  iconTheme: const IconThemeData(color: darkGrey),
);

//songcard header container backfround color and text color
class SongInfoContainerStyle {
  final Color backgroundColor;
  final Color textColor;

  SongInfoContainerStyle({
    required this.backgroundColor,
    required this.textColor,
  });
}

// Light Theme
SongInfoContainerStyle lightSongInfoContainerStyle = SongInfoContainerStyle(
  backgroundColor: Color.fromARGB(255, 240, 246, 251),
  textColor: Colors.black,
);

// Dark Theme
SongInfoContainerStyle darkSongInfoContainerStyle = SongInfoContainerStyle(
  backgroundColor: lightGrey,
  textColor: Colors.white,
);
