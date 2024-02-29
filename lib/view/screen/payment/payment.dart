import 'package:car_auction_new/view/screen/payment/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../base/app_bar.dart';
import '../../base/drawer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
          context,
          scaffoldKey,
          'Payment'
      ),
      drawer: AppDrawer(scaffoldKey: scaffoldKey),
      body: Container(
        padding: EdgeInsets.only(right: 20.w, left: 10.w,top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Enter Following Details order to make respective Payment',
                style: GoogleFonts.kanit(
                  fontSize: 21.sp,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Name',
                  style: GoogleFonts.kanit(fontSize: 16, color: Colors.black),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(35),
                child: TextFormField(
                  initialValue: 'Trishit',
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.top,
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  // controller: _firstNameController,
                  decoration: InputDecoration(
                    isDense: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Mobile Number',
                  style: GoogleFonts.kanit(fontSize: 16, color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: ScreenUtil().setHeight(35),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    initialValue: '+91-9876543210',
                    // controller: _lastNameController,
                    decoration: InputDecoration(
                        isDense: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Contact Person',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: ScreenUtil().setHeight(35),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    initialValue: 'Mango Teal Limited',
                    // controller: _companyNameController,
                    decoration: InputDecoration(
                        isDense: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: ScreenUtil().setHeight(35),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    // controller: _companyNameController,
                    initialValue: 'kfaruk@gmail.com',
                    decoration: InputDecoration(
                        isDense: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Registration ID',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: ScreenUtil().setHeight(35),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    // controller: _companyNameController,
                    initialValue: 'REG67899',
                    decoration: InputDecoration(
                        isDense: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Payment Of',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                    height: ScreenUtil().setHeight(36),
                    child: DropdownButtonFormField(
                      value: 'Select Payment Option',
                      borderRadius: BorderRadius.circular(15.r),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.grey[300],
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: '',
                        hintStyle: TextStyle(
                          fontFamily: 'Sansation',
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      items: ['Select Payment Option', 'Registration', 'Renewal', 'Refundable Security Deposit'].map((element) {
                        return DropdownMenuItem(
                          value: element,
                          child: SizedBox(
                            width: 200.w,
                            child: Text(
                              element,
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {

                      },
                    )
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(200, 40),
                  backgroundColor: Theme.of(context).primaryColor
                ),
                onPressed: () {
                  Get.to(()=>const PaymentMethodScreen());
                },
                child: Text(
                  'Make Payment',
                  style: GoogleFonts.kanit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(200, 40),
                  backgroundColor: Theme.of(context).primaryColor
                ),
                onPressed: () {Get.back();},
                child: Text(
                  'Cancel',
                  style: GoogleFonts.kanit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}