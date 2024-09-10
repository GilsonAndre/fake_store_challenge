import 'package:fake_store_one/data/blocs/bloc_cart/bloc/cart_bloc.dart';
import 'package:fake_store_one/ui/pages/detail_page.dart';
import 'package:fake_store_one/ui/pages/payment_page.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:fake_store_one/ui/widgets/toast_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.cartAppBar),
      ),
      //Show how much you need pay
      //Button with checkOut name for go to payment page but if is empty you cant go
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0.h, top: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Text(
                        'US\$ ${state.cartList},00',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: OutlinedButton(
                              onPressed: () {
                                if (state.productId.isEmpty) {
                                  //toastInfo for show error
                                  toastInfo(msg: Strings.toastInfoEmptyCart);
                                } else {
                                  //Go to paymentPage
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const PaymentPage(),
                                  ));
                                }
                              },
                              child: Text(
                                'Checkout',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(
                      10.w,
                      25.h,
                      10.w,
                      25.h,
                    ),
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
                    title: Text(
                      state.productId[index].title.toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      'US\$ ${state.productId[index].price.toString()},00',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    leading: Image.network(
                      state.productId[index].images!.first,
                    ),
                    //remove and minus a product from cart
                    trailing: IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(RemoveFromProductCart(state.productId[index]));
                        context
                            .read<CartBloc>()
                            .add(MinusFromProductCart(state.cartList));
                        toastInfo(msg: Strings.toastInfoRemove);
                      },
                      icon: const Icon(Icons.remove_shopping_cart),
                    ),
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
