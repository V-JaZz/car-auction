import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'countdown.dart';

class AuctionListTile extends StatelessWidget {
  final DateTime countDown;
  final String title;
  final String? location;
  final bool insurance;
  final bool bank;
  final bool close;
  final void Function()? onTap;
  final List<Map<String,dynamic>> vehicles;
  final String preTimer;

  const AuctionListTile({super.key, required this.countDown, required this.title, this.location, required this.insurance, required this.bank, required this.close, required this.vehicles, this.onTap, required this.preTimer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Theme.of(context).primaryColor,
      onTap: onTap,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 9.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time,size: 14.sp),
                  SizedBox(width: 6.w),
                  CountDownWidget(countDown:countDown,pre: preTimer),
                  const Spacer(),
                  Icon(Icons.lock,size: 14.sp,color: Colors.black54)
                ],
              ),
              SizedBox(height: 3.h),
              Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.kanit(
                    fontSize: 14.sp
                  )),
              SizedBox(height: 9.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconText(Icon(Icons.location_on_outlined,size: 16.sp,color: Colors.black87),location??'N/A'),
                  if(insurance) iconText(Icon(Icons.security,size: 16.sp,color: Colors.black87),'Insurance'),
                  if(bank) iconText(Icon(Icons.other_houses_outlined,size: 16.sp,color: Colors.black87),'Bank'),
                  if(close) iconText(Icon(Icons.highlight_off,size: 16.sp,color: Colors.black87),'Close'),
                  SizedBox(width: 24.w)
                ],
              ),
              SizedBox(height: 9.h),
              Row(
                children: [
                  for(Map<String, dynamic> v in vehicles)
                    vehicleTypeCount(v['icon'],v['count'])
                ],
              ),
              SizedBox(height: 3.h),

            ],
          ),
        ),
      ),
    );
  }

  iconText(icon, String text) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      children: [
        icon,
        Text(
            ' $text',
            style: GoogleFonts.kanit(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              color: Colors.black87
            ))
      ],

    );
  }

  vehicleTypeCount(IconData ic, String count) {
    return Container(
      margin: EdgeInsets.only(right: 9.w),
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black26),
        color: const Color(0xccD9D9D9)
      ),
      child:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ic,size: 12.sp,color: Colors.black54),
          SizedBox(width: 6.h),
          Text(count,
              style: GoogleFonts.kanit(
                  fontSize: 10.sp
              ))
        ],
      )
    );
  }
}
