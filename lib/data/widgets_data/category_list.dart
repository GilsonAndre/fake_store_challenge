import 'package:fake_store_one/data/models/product_model.dart';
import 'package:fake_store_one/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.context,
    required this.product, 
  });

  final BuildContext context;
  final List<ProductModel> product;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          final products = product[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 18.0.w,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      id: products.id!,
                      title: products.title.toString(),
                      price: products.price.toString(),
                      description: products.description.toString(),
                      images: products.images!,
                      
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170.h,
                    width: 160.w,
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
            ),
          );
        },
      ),
    );
  }
}

// Widget categoryList(
//     final BuildContext context, final List<ProductModel> product) {
//   return SizedBox(
//     height: 500.h,
//     width: MediaQuery.of(context).size.width,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: 15,
//       itemBuilder: (context, index) {
//         final products = product[index];
//         return Padding(
//           padding: EdgeInsets.only(
//             left: 18.0.w,
//           ),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const DetailPage(),
//                 ),
//               );
//             },
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 170.h,
//                   width: 160.w,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: NetworkImage(
//                         products.images!.first,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5.h),
//                 SizedBox(
//                   width: 160,
//                   child: Text(
//                     products.title.toString(),
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                 ),
//                 Text(
//                   'US\$ ${products.price.toString()},00',
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
