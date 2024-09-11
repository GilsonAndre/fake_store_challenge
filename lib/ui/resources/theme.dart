import 'package:fake_store_one/ui/resources/colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData themeLight() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColors.scaffoldBackGroundColor,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackGroundColor,
      textTheme: TextTheme(
        titleMedium: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        titleLarge: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          overflow: TextOverflow.ellipsis,
        ),
        headlineSmall: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodySmall: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
        bodyMedium: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
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
      //TextField
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  ThemeData themeDark() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          color: AppColors.darkBackGroundColor,
          titleTextStyle:
              TextStyle(color: AppColors.darkStringsColor, fontSize: 20)),
      scaffoldBackgroundColor: AppColors.darkBackGroundColor,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold, color: AppColors.darkStringsColor),
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
            color: AppColors.darkStringsColor),
        headlineSmall: TextStyle(
            fontWeight: FontWeight.bold, color: AppColors.darkStringsColor),
        bodySmall: TextStyle(
          color: AppColors.darkStringsColor,
          fontSize: 13,
        ),
        bodyMedium: TextStyle(
          color: AppColors.darkStringsColor,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        labelLarge: TextStyle(color: AppColors.darkStringsColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkBackGroundColor,
        unselectedItemColor: AppColors.darkStringsColor,
        selectedItemColor: AppColors.darkStringsColor,
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
      //TextField
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColors.darkStringsColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkStringsColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkStringsColor,
          ),
        ),
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(AppColors.darkPrimaryColor),
        ),
      ),
      listTileTheme: const ListTileThemeData(
          tileColor: AppColors.darkListTileBackGroundColor,
          iconColor: AppColors.darkPrimaryColor),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.darkListTileBackGroundColor,
      ),
    );
  }
}
