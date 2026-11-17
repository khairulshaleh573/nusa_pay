import 'package:flutter/material.dart';

class AppTheme {
  static const Color navy = Color.fromARGB(255, 46, 113, 1);
  static const Color blue = Color.fromARGB(255, 37, 235, 83);
  static const Color background = Color(0xFFF5F7FA);
  static const Color green = Color(0xFF16A34A);
  static const Color red = Color.fromARGB(255, 132, 220, 38);
  static const Color grey = Color(0xFF6B7280);

  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: navy.withValues(alpha: 0.08),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          primary: navy,
          secondary: blue,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: background,
        textTheme: Typography.blackMountainView.apply(
          bodyColor: navy,
          displayColor: navy,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 8,
          indicatorColor: blue.withValues(alpha: 0.12),
          labelTextStyle: WidgetStateProperty.resolveWith(
            (s) => TextStyle(
              fontSize: 12,
              fontWeight: s.contains(WidgetState.selected)
                  ? FontWeight.w700
                  : FontWeight.w500,
              color: s.contains(WidgetState.selected) ? blue : grey,
            ),
          ),
        ),
      );
}
