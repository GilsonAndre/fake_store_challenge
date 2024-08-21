import 'package:fake_store_one/ui/pages/aplication_page.dart';
import 'package:fake_store_one/ui/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

final ThemeApp themeApp = ThemeApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        theme: themeApp.themeLight(),
        home: const AplicationPage(),
      ),
    );
  }
}
