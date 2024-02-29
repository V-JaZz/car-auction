import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:car_auction_new/provider/profile_provider.dart';
import 'package:car_auction_new/view/screen/auth/login_email.dart';
import 'package:car_auction_new/view/screen/auth/widgets/custom_screen_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreenDecoration(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.power_settings_new_outlined,
            color: Colors.black,
            size: 50.sp,
          ),
          SizedBox(height: 20.h),
          Text(
            'Are You Sure You Want to logout The APP',
            style: GoogleFonts.kanit(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              minimumSize: const Size(179, 45),
            ),
            child: Text(
              'Yes',
              style: GoogleFonts.kanit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Provider.of<ProfileProvider>(context,listen: false).clearData();
              Get.offAll(()=>const LoginEmail());
            },
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              minimumSize: const Size(179, 45),
            ),
            child: Text(
              'No',
              style: GoogleFonts.kanit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
