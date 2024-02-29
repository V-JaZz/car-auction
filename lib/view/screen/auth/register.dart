import 'dart:io';
import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_email.dart';
import 'widgets/custom_screen_decoration.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenDecoration(
      body: Consumer<AuthProvider>(
        builder: (context, controller, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up Now',
              style: GoogleFonts.atkinsonHyperlegible(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              alignment: Alignment.topLeft,
              child: Text(
                'Sign Up Now',
                style: GoogleFonts.atkinsonHyperlegible(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.phoneController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_outlined),
                  labelText: 'Phone No.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outlined),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.confirmPasswordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outlined),
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.companyNameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.work_outline),
                  labelText: 'Company Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
                width: ScreenUtil().setWidth(303),
                height: ScreenUtil().setHeight(45),
                child: DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(15.r),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.grey[300],
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Select State',
                    prefixIcon: const Icon(
                      Icons.location_pin,
                      color: Colors.black,
                    ),
                  ),
                  menuMaxHeight: 300,
                  items: [
                    'Select State',
                    'Andhra Pradesh',
                    'Arunachal Pradesh',
                    'Assam',
                    'Bihar',
                    'Chhattisgarh',
                    'Goa',
                    'Gujarat',
                    'Haryana',
                    'Himachal Pradesh',
                    'Jharkhand',
                    'Karnataka',
                    'Kerala',
                    'Madhya Pradesh',
                    'Maharashtra',
                    'Manipur',
                    'Meghalaya',
                    'Mizoram',
                    'Nagaland',
                    'Odisha',
                    'Punjab',
                    'Rajasthan',
                    'Sikkim',
                    'Tamil Nadu',
                    'Telangana',
                    'Tripura',
                    'Uttar Pradesh',
                    'Uttarakhand',
                    'West Bengal',
                    'Delhi'
                  ].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: SizedBox(
                        width: 200.w,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.region = value!;
                  },
                )),
            const SizedBox(height: 20.0),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.companyAddressController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: ScreenUtil().setWidth(303),
              height: ScreenUtil().setHeight(45),
              child: TextFormField(
                controller: controller.panNumberController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.numbers),
                  labelText: 'Enter Pan Card Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ElevatedButton(
                onPressed: () async {
                  await controller.getImageFromGallery();
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.maxFinite, 50),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_upload_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Upload Pan'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            controller.panCardFile != ''
                ? Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Image.file(
                    File(controller.panCardFile),
                    height: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Pan Card File',
                    style: GoogleFonts.kanit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
                : Container(),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                minimumSize: const Size(179, 45),
              ),
              onPressed: () async {
                if(!controller.isLoading){
                  if (GetUtils.isEmail(controller.emailController.text)) {
                    if (controller.passwordController.text.isNotEmpty) {
                      if (controller.confirmPasswordController.text ==
                          controller.passwordController.text) {
                        if (controller.companyNameController.text.isNotEmpty &&
                            controller.companyAddressController.text.isNotEmpty &&
                            controller.nameController.text.isNotEmpty) {
                          await controller.sendOtp();
                        } else {
                          Get.snackbar(
                            "Authentication",
                            "Please don't leave any field empty",
                            icon: const Icon(
                              Icons.crisis_alert_outlined,
                              color: Colors.black,
                            ),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: const Color(0xffA9CBFF),
                            margin: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            colorText: Colors.black,
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Authentication",
                          "Password and confirm password are not the same",
                          icon: const Icon(
                            Icons.crisis_alert_outlined,
                            color: Colors.black,
                          ),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: const Color(0xffA9CBFF),
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          colorText: Colors.black,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Authentication",
                        "Please don't leave the password field empty",
                        icon: const Icon(
                          Icons.crisis_alert_outlined,
                          color: Colors.black,
                        ),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xffA9CBFF),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        colorText: Colors.black,
                      );
                    }
                  } else {
                    Get.snackbar(
                      "Authentication",
                      "The email is not valid address",
                      icon: const Icon(
                        Icons.crisis_alert_outlined,
                        color: Colors.black,
                      ),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: const Color(0xffA9CBFF),
                      margin:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                      colorText: Colors.black,
                    );
                  }
                }
              },
              child: controller.isLoading
                  ? const CircularProgressIndicator(color: Colors.black)
                  :const Text('Sign Up'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have account?',
                  style: GoogleFonts.kanit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w200,
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
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
