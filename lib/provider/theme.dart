import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';

final themeProvider = ChangeNotifierProvider(((ref) => CustomThemeProvider()));

class CustomThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  ThemeData get getCurrentTheme =>
      isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme;

  void changeTheme(bool? val) {
    if (val != null) {
      themeMode = val ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }
}

class MyThemes {
  static Color darkScaffoldBackgroundColor = const Color.fromRGBO(7, 17, 26, 1);
  static Color lightScaffoldBackgroundColor = Colors.grey.shade100;

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: MyThemes.lightScaffoldBackgroundColor,
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color(0xFF008b8b),
    iconTheme: const IconThemeData(color: kPrimaryColor),
    primarySwatch: Colors.yellow,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kBackgroundColor))),
  );
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(7, 17, 26, 1),
      colorScheme: const ColorScheme.dark(),
      primarySwatch: Colors.yellow,
      primaryColor: const Color(0xFF008b8b),
      iconTheme: IconThemeData(color: Colors.grey[400]),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(MyThemes.lightScaffoldBackgroundColor),
      )));
}
