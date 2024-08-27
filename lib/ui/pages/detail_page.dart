import 'package:dots_indicator/dots_indicator.dart';
import 'package:fake_store_one/data/blocs/bloc_cart/bloc/cart_bloc.dart';
import 'package:fake_store_one/data/blocs/bloc_products/bloc/product_bloc.dart';
import 'package:fake_store_one/data/models/product_model.dart';
import 'package:fake_store_one/ui/pages/cart_page.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images, 
    required this.product,
  });
  final int id;
  final String title;
  final String price;
  final String description;
  final List<String> images;
  final ProductModel product;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ProductBloc productBloc = ProductBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                const Text(Strings.detailPage),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(
                          
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400.h,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              widget.images[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                          DotsIndicator(
                            dotsCount: widget.images.length,
                            position: index,
                            decorator: const DotsDecorator(
                              activeColor: Colors.blue,
                              activeSize: Size(12, 12),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0.h, bottom: 4.0.h),
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Text(
                        'US\$ ${widget.price.toString()},00',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0.h, bottom: 10.0.h),
                        child: Text(
                          widget.description,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddProductCart(widget.product));
                                
                              },
                              child: Row(
                                children: [
                                  Text(
                                    Strings.addToCart,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  const Expanded(
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                Strings.buyNow,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
