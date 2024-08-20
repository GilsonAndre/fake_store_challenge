import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> tabs = [
    Text('PAGINA 0'),
    Text('PAGINA 1'),
    Text('PAGINA 2'),
  ];
  return tabs[index];
}
