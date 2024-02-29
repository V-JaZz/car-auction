import 'package:car_auction_new/data/datasource/remote/dio/dio_client.dart';
import 'package:car_auction_new/data/datasource/remote/exception/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../model/response/base/api_response.dart';

class AuthRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  bool isLoggedIn() {
    return sharedPreferences!.containsKey(AppConstants.token);
  }
  Future<void> saveUserToken(String token) async {
    try {
      await sharedPreferences!.setString(AppConstants.token, token);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> saveUserId(String uid) async {
    try {
      await sharedPreferences!.setString(AppConstants.userID, uid);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> sendOTP(mobile) async {
    try {
      final response = await dioClient!.post("${AppConstants.sendOtpUri}$mobile");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> loginEmail(email, password) async {
    try {
      final response = await dioClient!.post(AppConstants.emailLoginUri,
          data: {
        "username": email,
        "password": password
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> loginMobile(mobile) async {
    try {
      final response = await dioClient!.get("${AppConstants.getUserMobileUri}$mobile");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> signUpUser(
      name,
      companyName,
      companyAddress,
      email,
      phone,
      dob,
      password,
      panNumber,
      panCardFile,
      ) async {
    try {
      final response = await dioClient!.post(AppConstants.signUpUri,
          data: FormData.fromMap({
            'full_name': name,
            'company_name': companyName,
            'company_address': companyAddress,
            'email': email,
            'mobile': phone,
            'DOB': dob,
            'password': password,
            'PanNumber': panNumber,
            'region[]': '64d5b3972dab69ddd864e3bc',
            // 'username': 'mahesh_mhaske',
            // 'pin': '445588',
            // 'vehicle_limit': '5',
            // 'buying_amount': '55555',
            'PAN': await MultipartFile.fromFile(panCardFile),
          })
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
