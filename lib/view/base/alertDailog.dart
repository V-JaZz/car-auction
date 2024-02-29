import 'package:car_auction_new/util/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../screen/dashboard/dashboard.dart';

void showAlertDailog(String title,String subtitle) {
  showDialog(
    context: Get.context!,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(top: 16.h,left: 16.w),
      contentPadding: EdgeInsets.only(top: 3.h,left: 16.w,right: 16.w),
      actionsPadding: EdgeInsets.only(bottom: 6.h,right:12.h),
      iconPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 21.w),
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w500),
      ),
      content: Text(
        "Selected auction has not been assigned to you. Please Contact us at +916565768767.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Ok",
            style: TextStyle(
                color: Theme.of(Get.context!).primaryColor,
                fontSize: 14.sp
            ),
          ),
        ),
      ],
    ),
  );
}

void showExpandedDailog(String title,String subtitle,String text) {
  showDialog(
    context: Get.context!,
    builder: (ctx) => AlertDialog(
      shape: LinearBorder.none,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.only(top: 9.h),
      actionsPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 21.w),
      title: Container(
        padding: EdgeInsets.only(top: 16.h,bottom: 8.w),
        alignment: Alignment.center,
        color: const Color(0xffD9D9D9),
        child: Text(
          "Terms and Conditions",
          style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w500),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Text(
              """All The Auctions are Subject to Approval from Sellers
Please Bid Carefully Bids Once Placed Cannot be Canceled
Parking Charges NIL
Easy Auto Exchange Charges NIL
All the vehicles are sold as on " As is Where is Bests".
Auction is Posted Approval
In case of Back-out. Enter or Part of Security Deposit May be Forfeited and Buyer May be Backlisted.
It is on The Discretion of the seller to Approve a Vehicle as well As Cancel the Approval Any Time Before the Actual Lifting.
All Bids -Placed Are Valid till End of Month
The Payment of the Approved Vehicles by HDFC Needs to Be Deposited Within 72 Hours or Last Working Day of the Month Whichever Is Earlier 31st Jul 2023 in case.
Vehicles Once sold will Not be Taken Back
An Additional 1st Tax Will be collected At the Source (i.e., Dealership on Vehicle Costing Over Rs.10 Lakh""",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 3.w),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Get.offAll(()=>Dashboard(),transition: Transition.fadeIn);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const ContinuousRectangleBorder()
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                        color: Theme.of(Get.context!).highlightColor,
                        fontSize: 14.sp
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w)
            ],
          )
        ],
      ),
      actions: null,
    ),
  );
}