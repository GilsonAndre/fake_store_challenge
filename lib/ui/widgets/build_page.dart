import 'package:fake_store_one/ui/pages/home_page.dart';
import 'package:fake_store_one/ui/pages/search_page.dart';
import 'package:flutter/material.dart';

Widget buildPage(
  int index,
) {
  List<Widget> tabs = [
    const HomePage(),
    const SearchPage(id: 2),
    const Text('PAGINA 2'),
  ];
  return tabs[index];
}
