import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:car_auction_new/provider/profile_provider.dart';
import 'package:car_auction_new/view/screen/auth/forget_password.dart';
import 'package:car_auction_new/view/screen/auth/login_otp.dart';
import 'package:car_auction_new/view/screen/auth/register.dart';
import 'package:car_auction_new/view/screen/auth/widgets/custom_screen_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../dashboard/dashboard.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScreenDecoration(
        body: Consumer<AuthProvider>(
        builder: (context, controller, child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
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
                      style: GoogleFonts.poppins(
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
                    'Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 2.w,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 2.w,
                        ),
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
                  child:controller.isLoading
                      ? const CircularProgressIndicator(color: Colors.black)
                      :const Text('Login'),
                  onPressed: () async {
                    if(controller.emailController.text.isNotEmpty &&
                    controller.passwordController.text.isNotEmpty){
                      if(!controller.isLoading){
                        final user = await controller.signInByEmail();
                        if(user!=null){
                          final provider = Provider.of<ProfileProvider>(context,listen: false);
                          provider.user= user;
                          Get.offAll(()=> const Dashboard());
                        }
                      }
                    }else{
                      Get.snackbar(
                        "Error!",
                        "Fields cant be empty!",
                        backgroundColor: Colors.amberAccent,
                        colorText: Colors.black,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                        borderRadius: 10.r,
                      );
                    }
                  }
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
                        Get.to(()=>const LoginOTP(),transition: Transition.noTransition);
                      },
                      child: Text(
                        'OTP Login',
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
      ),
    );
  }
}
