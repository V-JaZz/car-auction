import 'package:car_auction_new/data/datasource/remote/dio/dio_client.dart';
import 'package:car_auction_new/data/datasource/remote/exception/api_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../model/response/base/api_response.dart';

class ProfileRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  ProfileRepo({required this.sharedPreferences,required this.dioClient});


  Future<ApiResponse> getUserInfo() async {
    try {
      final response = await dioClient!.get(AppConstants.getUserUri+getID());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  String getID() {
    return sharedPreferences?.getString(AppConstants.userID)??'';
  }

  void clearData() {
    sharedPreferences?.remove(AppConstants.token);
    sharedPreferences?.remove(AppConstants.userID);
    sharedPreferences?.clear();
  }

  Future<ApiResponse> changePassword(String password) async {
    try {
      final response = await dioClient!.post(
          AppConstants.resetPasswordUri,
          data: {
            "userId": getID(),
            "newPassword": password
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Future<ApiResponse> getConfig() async {
    // try {
    //   final response = await dioClient!.get(AppConstants.configUri);
    //   return ApiResponse.withSuccess(response);
    // } catch (e) {
    //   return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    // }
  // }
}
