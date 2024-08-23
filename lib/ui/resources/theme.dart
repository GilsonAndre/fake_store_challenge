import 'package:fake_store_one/ui/resources/colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData themeLight() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor,
      textTheme: TextTheme(
        titleMedium: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          overflow: TextOverflow.ellipsis
        ),
        bodySmall: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
        labelLarge: TextStyle(
          color: Colors.grey[600],
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(width: 2),
          ),
          shape: WidgetStatePropertyAll(
            ContinuousRectangleBorder(),
          ),
        ),
      ),
    );
  }
}
