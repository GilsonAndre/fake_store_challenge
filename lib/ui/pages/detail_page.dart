import 'package:dots_indicator/dots_indicator.dart';
import 'package:fake_store_one/ui/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10.w,
            ),
            const Text(Strings.detailPage),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/56/a7/5e/56a75e53bb711ad33db2c42566996ca4.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            DotsIndicator(
              dotsCount: 3,
              decorator: const DotsDecorator(
                activeColor: Colors.blue,
                activeSize: Size(12, 12),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h, bottom: 4.0.h),
                    child: Text(
                      'Title',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    'Price',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  //SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h, bottom: 10.0.h),
                    child: Text(
                      'OverView ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                Strings.addToCart,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Expanded(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            Strings.buyNow,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
