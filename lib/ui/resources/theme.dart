import 'package:fake_store_one/ui/resources/colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData themeLight() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
      ),
    );
  }
}
