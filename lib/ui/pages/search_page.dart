import 'package:fake_store_one/data/blocs/bloc_products/bloc/product_bloc.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:fake_store_one/ui/widgets/grid_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.id});
  final int id;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ProductBloc productBloc = ProductBloc();

  @override
  void initState() {
    productBloc.add(GetProductFromCategoryEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: 'Clothes',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: BlocBuilder<ProductBloc, ProductState>(
            bloc: productBloc,
            builder: (context, state) {
              if (state is ProductError) {
                return const Text(Strings.errorMessage);
              } else if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductSuccess) {
                return GridList(context: context, product: state.product);
              }
              return const Text(Strings.errorMessage);
            },
          ),
        ),
      ),
    );
  }
}
