import 'package:car_auction_new/data/datasource/remote/dio/dio_client.dart';
import 'package:car_auction_new/data/datasource/remote/exception/api_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../model/response/base/api_response.dart';

class AuctionRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  AuctionRepo({required this.sharedPreferences,required this.dioClient});


  Future<ApiResponse> getAllAuction() async {
    try {
      final response = await dioClient!.get(AppConstants.getAllAuctionUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> makeBid(String auctionId,int price) async {
    try {
      final response = await dioClient!.post(
          AppConstants.addBidUri,
          data: {
            "userId": getID(),
            "auctionId": auctionId,
            "bid_price": price
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addToWatchList(String auctionId) async {
    try {
      final response = await dioClient!.post(
          AppConstants.addToWatchListUri,
          data: {
            "userId": getID(),
            "auctionId": auctionId
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> removeFromWatchList(String auctionId) async {
    try {
      final response = await dioClient!.post(
          AppConstants.removeFromWatchListUri,
          data: {
            "userId": getID(),
            "auctionId": auctionId
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
