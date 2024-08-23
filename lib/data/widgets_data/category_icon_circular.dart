import 'package:fake_store_one/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryIconCircular extends StatelessWidget {
  const CategoryIconCircular({super.key, required this.category});

  final List<CategoryModel> category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final categorys = category[index];
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
}
