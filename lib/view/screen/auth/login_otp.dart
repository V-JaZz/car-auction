import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:car_auction_new/view/screen/auth/login_email.dart';
import 'package:car_auction_new/view/screen/auth/register.dart';
import 'package:car_auction_new/view/screen/auth/verify_otp.dart';
import 'package:car_auction_new/view/screen/auth/widgets/custom_screen_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../provider/profile_provider.dart';
import 'forget_password.dart';

class LoginOTP extends StatelessWidget {
  const LoginOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenDecoration(
      body: Consumer<AuthProvider>(
        builder: (context, controller, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: GoogleFonts.atkinsonHyperlegible(
                fontSize: 34.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.black,
                  height: 1.h,
                  width: 90.w,
                ),
                Text(
                  'Log in or sign up',
                  style: GoogleFonts.atkinsonHyperlegible(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 1.h,
                  width: 90.w,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.topLeft,
              child: Text(
                'Login',
                style: GoogleFonts.atkinsonHyperlegible(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                controller: controller.phoneController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                minimumSize: const Size(179, 45),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.black
              ),
              child: controller.isLoading
                  ? const CircularProgressIndicator(color: Colors.black)
                  : const Text('Login'),
              onPressed: () async {
                if(!controller.isLoading) {
                    final user = await controller.signInByPhone();
                    if(user!=null){
                      final provider = Provider.of<ProfileProvider>(context,listen: false);
                      provider.user= user;
                      await controller.sendOtp(login: true);
                    }
                }
              },
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: controller.rememberMe,
                      onChanged: (bool? value) {
                        controller.rememberMe = value!;
                      },
                    ),
                    Text(
                      'Remember me',
                      style: GoogleFonts.kanit(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const LoginEmail(),transition: Transition.noTransition);
                  },
                  child: Text(
                    'Email Login',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(()=>const ForgetPassword(),transition: Transition.noTransition);
                  },
                  child: Text(
                    'Forget Password?',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account?',
                  style: GoogleFonts.kanit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 14.0),
                InkWell(
                  onTap: () {
                    Get.to(()=>const SignUp(),transition: Transition.noTransition);
                  },
                  child: Text(
                    'Sign Up Now',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
