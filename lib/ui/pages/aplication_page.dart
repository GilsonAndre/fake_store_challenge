import 'package:fake_store_one/data/blocs/bloc_change_page/bloc/change_page_bloc.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:fake_store_one/ui/widgets/build_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AplicationPage extends StatefulWidget {
  const AplicationPage({super.key});

  @override
  State<AplicationPage> createState() => _AplicationPageState();
}

class _AplicationPageState extends State<AplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (value) {
              context.read<ChangePageBloc>().add(ChangePage(value));
            },
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
          body: buildPage(state.index),
        );
      },
    );
  }
}
