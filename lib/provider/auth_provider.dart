import 'dart:developer';
import 'package:car_auction_new/data/model/response/user_model.dart';
import 'package:car_auction_new/view/screen/auth/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../data/model/response/base/api_response.dart';
import '../data/repository/auth_repo.dart';
import '../view/screen/auth/login_email.dart';
import '../view/screen/dashboard/dashboard.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo? authRepo;

  AuthProvider({required this.authRepo});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;
  TextEditingController dobController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  String? otp;

  String region = 'Select State';
  bool _isLoading = false;
  String _panCardFile = '';
  String _uid = '';

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  bool get rememberMe => _rememberMe;
  set rememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }
  String get panCardFile => _panCardFile;
  set panCardFile(String value) {
    _panCardFile = value;
    notifyListeners();
  }
  String get uid => _uid;
  set uid(String value) {
    _uid = value;
    notifyListeners();
  }

  bool isLoggedIn() {
    return authRepo!.isLoggedIn();
  }

  Future<UserModel?> signInByEmail() async {
    isLoading = true;
    ApiResponse? res = await authRepo?.loginEmail(
      emailController.text,
      // 'test@gmail.com1',
      passwordController.text
      // 'Mahi@3332'
    );
    isLoading = false;
    if (res?.response !=null &&
        res?.response!.statusCode == 200){
      var data = res?.response?.data;
      if (data['success'] as bool == true) {
        if(_rememberMe){
          authRepo?.saveUserToken(data['token']);
          authRepo?.saveUserId(data['data']['_id'].toString());
        }
        return UserModel.fromJson(data['data'] as Map<String, dynamic>);
      } else {
        Get.snackbar(
          "Authentication",
          data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
      }
    } else {
      Get.snackbar(
        "Authentication",
        'Some Error occurred',
        backgroundColor: Colors.amberAccent,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        borderRadius: 10.r,
      );
    }
    return null;
  }

  Future<UserModel?> signInByPhone() async {
    isLoading = true;
    ApiResponse? res = await authRepo?.loginMobile(phoneController.text);
    isLoading = false;
    if (res?.response !=null &&
        res?.response!.statusCode == 200){
      var data = res?.response?.data;
      if (data['success'] as bool == true) {
        if(_rememberMe){
          authRepo?.saveUserToken(data['token']??'null');
          authRepo?.saveUserId(data['data']['_id'].toString());
        }
        return UserModel.fromJson(data['data'] as Map<String, dynamic>);
      } else {
        Get.snackbar(
          "Authentication",
          data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
      }
    } else {
      Get.snackbar(
        "Authentication",
        'Some Error occurred',
        backgroundColor: Colors.amberAccent,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        borderRadius: 10.r,
      );
    }
    return null;
  }

  Future<void> sendOtp({bool? resend, bool? login}) async {
    if (login==true || panCardFile != '') {
      if(int.tryParse(phoneController.text) != null && phoneController.text.length == 10){
        resend == true ?null :isLoading = true;
        ApiResponse? res = await authRepo?.sendOTP(phoneController.text);
        resend == true ?null :isLoading = false;
        if (res?.response !=null &&
            res?.response!.statusCode == 200) {
          var data = res?.response?.data;
          log('This is the email auth response: $data');
          if (data['success'] == true) {
            // uid.value = data['data']['_id'];
            otp=data['data']['body'].toString().substring(16);
            print('qqqwww $otp');
            resend == true ?null :Get.to(()=>VerifyOTP(login: login));
          } else {
            Get.snackbar(
              "Authentication",
              data['message'].toString(),
              backgroundColor: Colors.amberAccent,
              colorText: Colors.black,
              snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              borderRadius: 10.r,
            );
          }
        } else {
          Get.snackbar(
            "Authentication",
            'Some Error occurred',
            backgroundColor: Colors.amberAccent,
            colorText: Colors.black,
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            borderRadius: 10.r,
          );
        }
      }else{
        Get.snackbar(
          "Authentication",
          "Please enter a valid phone number",
          icon: const Icon(
            Icons.crisis_alert_outlined,
            color: Colors.black,
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xffA9CBFF),
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          colorText: Colors.black,
        );
      }
    } else {
      Get.snackbar(
        "Authentication",
        "Please attach your pan card",
        icon: const Icon(
          Icons.crisis_alert_outlined,
          color: Colors.black,
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xffA9CBFF),
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        colorText: Colors.black,
      );
    }
  }

  validateOtp({bool? login}) async {
    log('${otpController.text} is the otp');
    if (otpController.text.length == 4) {
          if (otp?.trim() == otpController.text) {
            if(login==true){
              Get.offAll(()=> Dashboard());
            }else{
              await signUp();
            }
          } else {
            Get.snackbar(
              "Error!",
              'Invalid OTP!',
              snackStyle: SnackStyle.FLOATING,
              icon: const Icon(
                Icons.person,
                color: Color(0xff28282B),
              ),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.grey[200],
              borderRadius: 10.r,
              margin: EdgeInsets.all(10.w),
              padding: EdgeInsets.all(15.w),
              colorText: const Color(0xff28282B),
              duration: const Duration(seconds: 4),
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }
    } else {
      Get.snackbar(
        "OTP",
        'Please enter a valid Otp number',
        snackStyle: SnackStyle.FLOATING,
        icon: const Icon(
          Icons.person,
          color: Color(0xff28282B),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[200],
        borderRadius: 10.r,
        margin: EdgeInsets.all(10.w),
        padding: EdgeInsets.all(15.w),
        colorText: const Color(0xff28282B),
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  Future<UserModel?> signUp() async {
    isLoading = true;
    var res = await authRepo?.signUpUser(
      nameController.text,
      companyNameController.text,
      companyAddressController.text,
      emailController.text,
      phoneController.text,
      dobController.text,
      passwordController.text,
      panNumberController.text,
      panCardFile,
    );
    isLoading = false;
    if (res?.response !=null &&
        res?.response!.statusCode == 200){
      var data = res?.response?.data;
      if (data['success'] as bool == true) {
        if(_rememberMe){
          authRepo?.saveUserToken(data['token']);
          authRepo?.saveUserId(data['data']['_id'].toString());
        }
        Get.offAll(const LoginEmail());
        return UserModel.fromJson(data['data']);
      } else {
        Get.snackbar(
          "Authentication",
          data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
      }
    } else {
      Get.snackbar(
        "Authentication",
        res?.error,
        backgroundColor: Colors.amberAccent,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        borderRadius: 10.r,
      );
    }
    return null;
  }

  getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      panCardFile = pickedFile.path;
    }
  }
}