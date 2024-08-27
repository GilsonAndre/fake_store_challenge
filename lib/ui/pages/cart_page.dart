import 'package:fake_store_one/data/blocs/bloc_cart/bloc/cart_bloc.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(Strings.cart),
          ),
          body: ListView.builder(
            itemCount: state.productId.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.productId[index].title.toString()),
                subtitle:
                    Text('US\$ ${state.productId[index].price.toString()},00'),
                leading: Image.network(state.productId[index].images!.first),
                trailing: IconButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(RemoveFromProductCart(state.productId[index]));
                  },
                  icon: const Icon(Icons.remove_shopping_cart),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
