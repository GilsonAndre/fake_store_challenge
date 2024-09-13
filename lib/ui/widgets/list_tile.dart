import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget listTile(BuildContext context, String title, Function() onTap) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.0.h),
    child: Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.only(
          bottom: 5.h,
          top: 5.h,
          left: 10.w,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    ),
  );
}
