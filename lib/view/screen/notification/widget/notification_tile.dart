

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String body;
  final DateTime dateTime;
  const NotificationTile({
    super.key, required this.title, required this.body, required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        // controller.notificationList[index1][index2].title.toString(),
        style: GoogleFonts.kanit(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            body,
            style: GoogleFonts.kanit(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.access_time,color: Colors.black87,size: 16.sp),
              SizedBox(width:3.w),
              Text(
                formatDateTime(dateTime),
                // controller.notificationList[index1][index2].body.toString(),
                style: GoogleFonts.kanit(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('MM-dd-yyyy hh:mm:ss a');
    return formatter.format(dateTime);
  }
}