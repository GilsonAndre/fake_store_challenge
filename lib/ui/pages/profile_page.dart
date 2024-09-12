import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 80.h,
              width: 80.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.racasdecachorro.com.br/wp-content/uploads/2019/04/683-golden-37260766.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
