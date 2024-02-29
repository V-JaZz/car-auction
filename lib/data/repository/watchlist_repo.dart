import 'package:car_auction_new/data/datasource/remote/dio/dio_client.dart';
import 'package:car_auction_new/data/datasource/remote/exception/api_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../model/response/base/api_response.dart';

class WatchlistRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  WatchlistRepo({required this.sharedPreferences,required this.dioClient});


  Future<ApiResponse> getAllWatchList() async {
    try {
      final response = await dioClient!.get(AppConstants.getWatchListUri+getID());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  String getID() {
    return sharedPreferences?.getString(AppConstants.userID)??'';
  }
}
