import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Nunito',
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade800,
    onPrimary: Colors.grey.shade900,
    onSurface: Colors.grey.shade800,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'Nunito',
    bodyColor: Colors.grey[800],
    displayColor: Colors.black,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.grey.shade900,
    selectionColor: Colors.grey.shade400,
    selectionHandleColor: Colors.grey.shade800,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.grey.shade700),
      backgroundColor: WidgetStateProperty.all(Colors.grey.shade200),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Nunito'),
      ),
      elevation: WidgetStateProperty.all(0),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return Colors.black.withValues(alpha: .08);
        }
        if (states.contains(WidgetState.hovered)) {
          return Colors.black.withValues(alpha: .04);
        }
        return null;
      }),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.grey.shade800,
    unselectedItemColor: Colors.grey.shade600,
  ),
  dividerTheme: DividerThemeData(color: Colors.grey.shade400),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200,
    hintStyle: TextStyle(color: Colors.grey.shade600),
    labelStyle: TextStyle(color: Colors.grey.shade800),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade700, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
);
