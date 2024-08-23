import 'package:fake_store_one/data/blocs/bloc_category/bloc/category_bloc.dart';
import 'package:fake_store_one/data/blocs/bloc_products/bloc/product_bloc.dart';
import 'package:fake_store_one/ui/pages/aplication_page.dart';
import 'package:fake_store_one/ui/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

final ThemeApp themeApp = ThemeApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          theme: themeApp.themeLight(),
          home: const AplicationPage(),
        ),
      ),
    );
  }
}
