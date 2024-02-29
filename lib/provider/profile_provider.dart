import 'package:car_auction_new/data/model/response/base/api_response.dart';
import 'package:car_auction_new/data/repository/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../data/model/response/user_model.dart';
import '../helper/api_checker.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepo? profileRepo;
  ProfileProvider({required this.profileRepo});

  UserModel? user;

  Future<void> getUserInfo() async {
    ApiResponse apiResponse = await profileRepo!.getUserInfo();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      var data = apiResponse.response?.data;
      if(data['success'] as bool == true){
        user = UserModel.fromJson(data['data'][0]);
      }else{
        Get.snackbar(
          "Error!",
          data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
      }
    } else {
      ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }

  void clearData() {
    profileRepo!.clearData();
  }

  changePassword(String password) async {
    ApiResponse apiResponse = await profileRepo!.changePassword(password);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      var data = apiResponse.response?.data;
      if(data['status'] as bool == true){
        Get.snackbar(
          "Password updated!",
          data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
      }else{
        Get.snackbar(
          "Error!",
          data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
      }
    } else {
      ApiChecker.checkApi( apiResponse);
    }
    notifyListeners();
  }
}