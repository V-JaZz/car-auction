import 'dart:async';

import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_screen_decoration.dart';

class VerifyOTP extends StatelessWidget {
  final bool? login;
  const VerifyOTP({super.key, this.login});

  @override
  Widget build(BuildContext context) {
    return CustomScreenDecoration(
      body: Consumer<AuthProvider>(
        builder: (context, controller, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP Number',
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: PinCodeTextField(
                controller: controller.otpController,
                autoDisposeControllers: false,
                autoFocus: true,
                length: 4,
                obscureText: false,
                animationType: AnimationType.none,
                cursorColor: Colors.black,
                textStyle: const TextStyle(color: Colors.black),
                enableActiveFill: true,
                pinTheme: PinTheme(
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 2.w),
                  inactiveColor: Colors.black.withOpacity(0.2),
                  selectedColor: Colors.amberAccent,
                  selectedFillColor: Colors.white,
                  activeColor: Colors.amber,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  errorBorderColor: null,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5.r),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
                animationDuration: const Duration(milliseconds: 300),
                onCompleted: (value) {},
                onChanged: (value) {
                  // code = value;
                },
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: context,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                minimumSize: const Size(179, 45),
              ),
              onPressed: () async {
                if(!controller.isLoading) {
                  await controller.validateOtp(login: login);
                }
              },
              child:controller.isLoading
                  ? const CircularProgressIndicator(color: Colors.black)
                  : const Text('Verify'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Resend()
          ],
        ),
      ),
    );
  }
}

class Resend extends StatefulWidget {
  const Resend({super.key});

  @override
  State<Resend> createState() => _ResendState();
}

class _ResendState extends State<Resend> {
  late Timer timer;
  bool resend = false;
  int timeLeft = 30;
  @override
  void initState() {
    countDown();
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            !resend?'Wait $timeLeft s to':'Did\'t received?',
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          Consumer<AuthProvider>(
            builder: (context, value, _) => TextButton(
              onPressed: (){
                if(resend){
                  value.sendOtp(resend: true);
                  reset();
                }
              },
              child:
              Text(
                'Resend',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              ),),
          ),
        ],
      );
  }

  void reset() {
    if(resend) {
      setState(() {
      resend = false;
    });
    }
    setState(() {
      timeLeft = 30;
    });
    countDown();
  }
  void countDown() async {
    timer = Timer.periodic(
        const Duration(seconds: 1), (timer) {
        if(timer.tick<30){
          setState(() {
            timeLeft = 30-timer.tick;
          });
        }else{
          setState(() {
            resend = true;
          });
          timer.cancel();
        }
    });
  }
}

