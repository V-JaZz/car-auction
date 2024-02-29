import 'package:car_auction_new/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScreenDecoration extends StatelessWidget {
  final Widget body;
  final bool isGradient;
  const CustomScreenDecoration({this.isGradient = false, required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    isGradient ? Colors.amber : Colors.white,
                  ]
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Image.asset(
                    Images.decTop,
                  ),
                  Image.asset(
                    Images.decTop1,
                  ),
                ],
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height-320.h,
                ),
                child: body,
              ),
              SizedBox(
                height: 150.h,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -5,
                      child: Image.asset(
                        Images.decBottom1,
                        height: 145.h,
                        width: MediaQuery.of(context).size.width + 40.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        Images.decBottom,
                        height: 80.h,
                        width: MediaQuery.of(context).size.width + 30.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
