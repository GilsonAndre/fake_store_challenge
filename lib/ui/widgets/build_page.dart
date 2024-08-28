import 'package:fake_store_one/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> tabs = [
    const HomePage(),
    const Text('PAGINA 1'),
    const Text('PAGINA 2'),
  ];
  return tabs[index];
}
