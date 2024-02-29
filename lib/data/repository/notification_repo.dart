import 'package:car_auction_new/data/datasource/remote/dio/dio_client.dart';
import 'package:car_auction_new/data/datasource/remote/exception/api_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../model/response/base/api_response.dart';

class NotificationRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  NotificationRepo({required this.sharedPreferences,required this.dioClient});

  Future<ApiResponse> getAllNotifications() async {
    try {
      final response = await dioClient!.post(
        AppConstants.notificationsUri,
          data: {
            "userId": getID(),
            "key": 0
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getAllUnreadNotifications() async {
    try {
      final response = await dioClient!.post(
          AppConstants.notificationsUri,
          data: {
            "userId": getID(),
            "key": 1
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getAllReadNotifications() async {
    try {
      final response = await dioClient!.post(
          AppConstants.notificationsUri,
          data: {
            "userId": getID(),
            "key": 2
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  String getID() {
    return sharedPreferences?.getString(AppConstants.userID)??'';
  }
}
