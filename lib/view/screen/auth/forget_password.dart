import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:car_auction_new/view/screen/auth/login_email.dart';
import 'package:car_auction_new/view/screen/auth/register.dart';
import 'package:car_auction_new/view/screen/auth/widgets/custom_screen_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenDecoration(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Consumer<AuthProvider>(
          builder: (context, controller, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Text(
                'Forget Password',
                style: GoogleFonts.atkinsonHyperlegible(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  'Forget Password',
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: 'Enter your Email',
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(179, 45),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.black
                ),
                child:
                controller.isLoading
                    ? CircularProgressIndicator(color: Colors.black)
                    : const Text('Reset Password'),
                onPressed: () {
                  if(!controller.isLoading){
                  }
                },
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Don\'t have account?',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 14.0),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>const SignUp(),transition: Transition.noTransition);
                    },
                    child: Text(
                      'Sign Up Now',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Already have account?',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 14.0),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>const LoginEmail(),transition: Transition.noTransition);
                    },
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
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
