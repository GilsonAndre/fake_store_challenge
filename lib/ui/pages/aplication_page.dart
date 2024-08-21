import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:fake_store_one/ui/widgets/build_page.dart';
import 'package:flutter/material.dart';

class AplicationPage extends StatelessWidget {
  const AplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: Strings.bottomBarHome,
            icon: Icon(Icons.house_outlined),
          ),
          BottomNavigationBarItem(
            label: Strings.bottomBarSearch,
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: Strings.bottomBarCategory,
            icon: Icon(Icons.list_alt_outlined),
          ),
          BottomNavigationBarItem(
            label: Strings.bottomBarProfile,
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: buildPage(0),
    );
  }
}
