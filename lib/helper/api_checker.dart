import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:car_auction_new/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../data/model/response/base/api_response.dart';
import '../view/screen/auth/login_email.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
      Provider.of<ProfileProvider>(Get.context!,listen: false).clearData();
      Navigator.of(Get.context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginEmail()), (route) => false);
    }else {
      if (apiResponse.error is String) {
      } else {
      }
    }
  }
}