import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../base/app_bar.dart';
import '../../base/drawer.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
          context,
          scaffoldKey,
          'Help'
      ),
      drawer: AppDrawer(scaffoldKey: scaffoldKey),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Contact Us',
                style: GoogleFonts.kanit(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Bank Auction',
                style: GoogleFonts.kanit(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Icon(Icons.email_outlined),
                  SizedBox(width: 5.h),
                  Text(
                    'demoauction@gmail.com',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Icon(Icons.call),
                  SizedBox(width: 5.h),
                  Text(
                    '+919876543215',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Customer Auction',
                style: GoogleFonts.kanit(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Icon(Icons.email_outlined),
                  SizedBox(width: 5.h),
                  Text(
                    'abc@gmail.com',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Icon(Icons.call),
                  SizedBox(width: 5.h),
                  Text(
                    '+91987654321',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Insurance Auctions',
                style: GoogleFonts.kanit(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Icon(Icons.email_outlined),
                  SizedBox(width: 5.h),
                  Text(
                    'abcd@gmail.com',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Icon(Icons.call),
                  SizedBox(width: 5.h),
                  Text(
                    '+919876543210',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ElevatedButton(
                onPressed: () async {
                  _launchUrl(Uri.parse(
                  'whatsapp://send?phone=+919588876587&text=Hello+Sir'));
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    backgroundColor: const Color(0xff25D366),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/whatsapp_icon.png',
                      height: 32.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text('Whatsapp',style: TextStyle(color: Colors.white,fontSize: 16),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}