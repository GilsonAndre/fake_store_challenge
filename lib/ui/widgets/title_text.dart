import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//widget responsable for title
Widget titleText(String categoryName, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18.0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    ),
  );
}
