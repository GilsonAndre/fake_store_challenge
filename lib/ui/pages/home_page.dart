import 'package:fake_store_one/data/blocs/bloc_category/bloc/category_bloc.dart';
import 'package:fake_store_one/data/blocs/bloc_products/bloc/product_bloc.dart';
import 'package:fake_store_one/data/widgets_data/category_list.dart';
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
            BlocBuilder<CategoryBloc, CategoryState>(
              bloc: categoryBloc,
              builder: (context, state) {
                if (state is CategoryError) {
                  const Center(
                    child: Text('Something went Wrong'),
                  );
                } else if (state is CategoryLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CategorySuccess) {
                  return SizedBox(
                    height: 100.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: state.category.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final categorys = state.category[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 18.0.w),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 60.h,
                                  width: 60.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(categorys.image!),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                categorys.name.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Text('ERROR');
              },
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
                  return CategoryList(
                    context: context,
                    product: state.product,
                  );
                } else {
                  return const Text('ERROR');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
