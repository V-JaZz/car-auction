import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/countdown.dart';

class CountDownWidget extends StatefulWidget {
  final DateTime countDown;
  final String pre;
  const CountDownWidget({super.key, required this.countDown, required this.pre});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}
class _CountDownWidgetState extends State<CountDownWidget> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text(
          calculateTimeLeft(widget.countDown,widget.pre),
          style: GoogleFonts.kanit(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300
          ));
  }
}
