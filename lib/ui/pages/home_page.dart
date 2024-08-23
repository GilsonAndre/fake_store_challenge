import 'package:fake_store_one/data/blocs/bloc_products/bloc/product_bloc.dart';
import 'package:fake_store_one/ui/pages/detail_page.dart';
import 'package:fake_store_one/ui/resources/colors.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    productBloc.add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
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
            SizedBox(
              height: 100.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 18.0.w),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 60.h,
                            width: 60.h,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Text(
                          'Woman',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            //show only the clothes category
            seeAllText(Strings.clothesForyou, context),
            //show photo,name and price but don't show all clothes
            BlocBuilder<ProductBloc, ProductState>(
              bloc: productBloc,
              builder: (context, state) {
                if (state is ProductError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                } else if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProductSuccess) {
                  return SizedBox(
                    height: 500.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        final products = state.product[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 18.0.w,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DetailPage(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 170.h,
                                  width: 140.w,
                                  decoration: const BoxDecoration(
                                    color: AppColors.listViewBackgroundColor,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  products.title.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  products.price.toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Text('ERROR');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
