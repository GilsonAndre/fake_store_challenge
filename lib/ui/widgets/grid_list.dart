import 'package:fake_store_one/data/models/product_model.dart';
import 'package:fake_store_one/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridList extends StatelessWidget {
  const GridList({
    super.key,
    required this.context,
    required this.product,
  });

  final BuildContext context;
  final List<ProductModel> product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        padding: EdgeInsets.only(top: 10.h, bottom: 140.h),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 320,
        ),
        itemCount: product.length,
        itemBuilder: (context, index) {
          final products = product[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    id: products.id!,
                    title: products.title.toString(),
                    price: products.price.toString(),
                    description: products.description.toString(),
                    images: products.images!,
                    product: products,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        products.images!.first,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 160,
                  child: Text(
                    products.title.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Text(
                  'US\$ ${products.price.toString()},00',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
