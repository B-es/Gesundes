import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  Brightness _brightness = Brightness.dark;
  const Color _primary = Color.fromARGB(255, 0, 118, 71);
  const Color _onPrimary = Color.fromARGB(255, 0, 118, 71);
  const Color _secondary = Color.fromARGB(255, 255, 178, 123);
  const Color _onSecondary = Color.fromARGB(255, 255, 178, 123);
  Color _error = Colors.orangeAccent;
  Color _onError = Colors.orangeAccent;
  Color _background = Colors.white;
  Color _onBackground = Colors.white;
  Color _surface = Colors.white;
  Color _onSurface = Colors.white;

  final ColorScheme _colorScheme = ColorScheme(
      brightness: _brightness,
      primary: _primary,
      onPrimary: _onPrimary,
      secondary: _secondary,
      onSecondary: _onSecondary,
      error: _error,
      onError: _onError,
      background: _background,
      onBackground: _onBackground,
      surface: _surface,
      onSurface: _onSurface);

  const String fontFamily = "KulimPark";

  const TextTheme primaryTextTheme = TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontFamily: fontFamily,
      fontSize: 14,
    ),
  );

  const TextTheme textTheme = TextTheme(
    bodyMedium: TextStyle(
      color: _primary,
      fontFamily: fontFamily,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      color: _primary,
      fontFamily: fontFamily,
      fontSize: 22,
    ),
  );

  const OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(45)),
    gapPadding: 1,
    borderSide: BorderSide(
      width: 2,
      color: _primary,
    ),
  );

  const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      fillColor: Colors.transparent,
      hintStyle: TextStyle(
        color: Color.fromARGB(122, 0, 118, 71),
        fontFamily: fontFamily,
      ),
      enabledBorder: _outlineInputBorder,
      focusedBorder: _outlineInputBorder,
      contentPadding: EdgeInsets.only(left: 15, right: 15));

  return ThemeData(
    colorScheme: _colorScheme,
    primaryTextTheme: primaryTextTheme,
    textTheme: textTheme,
    primaryColor: _primary,
    inputDecorationTheme: inputDecorationTheme,
    fontFamily: fontFamily,
    disabledColor: _secondary,
    splashColor: Colors.transparent,
  );
}
