import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Nunito',
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
    onPrimary: Colors.grey.shade100,
    onSurface: Colors.grey.shade300,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'Nunito',
    bodyColor: Colors.grey[300],
    displayColor: Colors.white,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.grey.shade100,
    selectionColor: Colors.grey.shade700,
    selectionHandleColor: Colors.grey.shade300,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.grey.shade100),
      backgroundColor: WidgetStateProperty.all(Colors.grey.shade800),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Nunito'),
      ),
      elevation: WidgetStateProperty.all(0),
      shadowColor: WidgetStateProperty.all(Colors.transparent),
      surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return Colors.white.withValues(alpha: .08);
        }
        if (states.contains(WidgetState.hovered)) {
          return Colors.white.withValues(alpha: .04);
        }
        return null;
      }),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.grey.shade300,
    unselectedItemColor: Colors.grey.shade500,
  ),
  dividerTheme: DividerThemeData(color: Colors.grey.shade700),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade800,
    hintStyle: TextStyle(color: Colors.grey.shade500),
    labelStyle: TextStyle(color: Colors.grey.shade300),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade700),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
);
