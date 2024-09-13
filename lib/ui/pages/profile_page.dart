import 'package:fake_store_one/ui/resources/colors.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:fake_store_one/ui/widgets/list_tile.dart';
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
          Switch(
            value: true,
            onChanged: (value) {},
            activeTrackColor: AppColors.darkPrimaryColor,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://www.racasdecachorro.com.br/wp-content/uploads/2019/04/683-golden-37260766.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              listTile(context, Strings.myProfileProfile, () {}),
              listTile(context, Strings.myPurchasesProfile, () {}),
              listTile(context, Strings.messagesProfile, () {}),
              listTile(context, Strings.locationProfile, () {}),
              listTile(context, Strings.settingsProfile, () {}),
            ],
          ),
        ),
      ),
    );
  }
}
