import 'package:fake_store_one/data/blocs/bloc_cart/bloc/cart_bloc.dart';
import 'package:fake_store_one/data/blocs/bloc_category/bloc/category_bloc.dart';
import 'package:fake_store_one/data/blocs/bloc_products/bloc/product_bloc.dart';
import 'package:fake_store_one/ui/pages/cart_page.dart';
import 'package:fake_store_one/ui/widgets/category_icon_circular.dart';
import 'package:fake_store_one/ui/widgets/grid_list.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:fake_store_one/ui/widgets/see_all_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final ProductBloc productBloc = ProductBloc();
final CategoryBloc categoryBloc = CategoryBloc();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    productBloc.add(GetProductEvent());
    categoryBloc.add(GetCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    Positioned(
                      left: 30.w,
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Text(
                          state.productId.length.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Banner for discounts or anything you want show for everyone
              Container(
                height: 150.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              //shows every category
              seeAllText(Strings.shopByCategory, context),
              //category with photo and description
              BlocBuilder<CategoryBloc, CategoryState>(
                bloc: categoryBloc,
                builder: (context, state) {
                  if (state is CategoryError) {
                    const Center(
                      child: Text(Strings.errorMessage),
                    );
                  } else if (state is CategoryLoading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CategorySuccess) {
                    return CategoryIconCircular(category: state.category);
                  }
                  return const SizedBox();
                },
              ),
              //show everything
              seeAllText(Strings.everythingForyou, context),
              //show all clothes
              BlocBuilder<ProductBloc, ProductState>(
                bloc: productBloc,
                builder: (context, state) {
                  if (state is ProductError) {
                    return const Center(
                      child: Text(Strings.errorMessage),
                    );
                  } else if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProductSuccess) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: GridList(
                        context: context,
                        product: state.product,
                      ),
                    );
                  } else {
                    return const Text(Strings.errorMessage);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
