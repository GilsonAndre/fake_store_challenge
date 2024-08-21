import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//widget responsable for do category + see all 
Widget seeAllText(String categoryName, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(Strings.seeAll),
        ),
      ],
    ),
  );
}
