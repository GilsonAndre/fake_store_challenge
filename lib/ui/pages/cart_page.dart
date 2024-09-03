import 'package:fake_store_one/data/blocs/bloc_cart/bloc/cart_bloc.dart';
import 'package:fake_store_one/ui/pages/detail_page.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.cart),
      ),
      //Show how much you need pay
      //Button with checkOut name for go to payment page but if is empty you cant go
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 90.h,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0.h, top: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Total: ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Text(
                        'US\$ ${state.cartList},00',
                        style: Theme.of(context).textTheme.titleLarge,
                      );
                    },
                  ),
                ],
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        onPressed: () {
                          if (state.productId.isEmpty) {
                            //toastInfo for show error
                          } else {
                            //Go to Buy everything
                          }
                        },
                        child: Text(
                          'Checkout',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      //show all products, price e photos in a listtile
      //when you click you go to detail page if you want check anything before buy 
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.productId.isNotEmpty) {
            return ListView.builder(
              itemCount: state.productId.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    //todo: named routes
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          id: state.productId[index].id!,
                          title: state.productId[index].title!,
                          price: state.productId[index].price.toString(),
                          description: state.productId[index].description!,
                          images: state.productId[index].images!,
                          product: state.productId.first,
                        ),
                      ),
                    );
                  },
                  title: Text(state.productId[index].title.toString()),
                  subtitle: Text(
                      'US\$ ${state.productId[index].price.toString()},00'),
                  leading: Image.network(state.productId[index].images!.first),
                  //remove and minus a product from cart
                  trailing: IconButton(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(RemoveFromProductCart(state.productId[index]));
                      context
                          .read<CartBloc>()
                          .add(MinusFromProductCart(state.cartList));
                    },
                    icon: const Icon(Icons.remove_shopping_cart),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(Strings.cartEmpty),
            );
          }
        },
      ),
    );
  }
}
