import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildRadioContainer(String imageName) {
  return Container(
    width: ScreenUtil().setWidth(194).w,
    height: ScreenUtil().setHeight(44).h,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      color: Colors.white,
      borderRadius: BorderRadius.circular(0),
    ),
    // child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Image.asset(
    //       imageName,
    //       width: 50,
    //       height: 30,
    //     ),
    //   ],
    // ),
    child: Center(
      child: Image.asset(
        imageName,
      ),
    ),
  );
}