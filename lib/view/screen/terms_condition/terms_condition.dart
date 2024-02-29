import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../base/app_bar.dart';
import '../../base/drawer.dart';

class TermsScreen extends StatelessWidget {
  TermsScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
          context,
          scaffoldKey,
          'Terms & Conditions'
      ),
      drawer: AppDrawer(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(21.sp),
          child: Text(
            "terms_conditions".tr,
            style: GoogleFonts.kanit(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}