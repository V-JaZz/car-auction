import 'package:car_auction_new/data/model/response/base/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/model/response/all_auction_model.dart';
import '../data/model/response/user_model.dart';
import '../data/repository/auction_repo.dart';
import '../helper/api_checker.dart';

class AuctionProvider extends ChangeNotifier {
  final AuctionRepo? auctionRepo;
  AuctionProvider({required this.auctionRepo});

  TextEditingController searchLiveController = TextEditingController();
  TextEditingController searchUpcomingController = TextEditingController();

  bool _isSearchingLive = false;
  bool get isSearchingLive => _isSearchingLive;
  bool _isSearchingUpcoming = false;
  set isSearchingLive(bool value) {
    _isSearchingLive = value;
    notifyListeners();
  }
  bool get isSearchingUpcoming => _isSearchingUpcoming;
  set isSearchingUpcoming(bool value) {
    _isSearchingUpcoming = value;
    notifyListeners();
  }
  bool _isAllLoading = true;

  bool get isAllLoading => _isAllLoading;
  set isAllLoading(bool value) {
    _isAllLoading = value;
    notifyListeners();
  }

  List<AllAuctionModel> allAuctions = <AllAuctionModel>[];
  List<AllAuctionModel> liveList = <AllAuctionModel>[];
  List<AllAuctionModel> upcomingList = <AllAuctionModel>[];

  DateTime now = DateTime.now();

  getAuctionData() async {
    ApiResponse apiResponse = await auctionRepo!.getAllAuction();
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      var data = apiResponse.response?.data;
      if(apiResponse.response?.data != null && data['status'] == true){
        allAuctions = allAuctionModelFromJson(data['data']);
        liveList.clear();
        upcomingList.clear();
        for (var auction in allAuctions) {
          if (auction.startTime!.isBefore(now) && auction.endTime!.isAfter(now)) {
            liveList.add(auction);
          } else if (auction.startTime!.isAfter(now)) {
            upcomingList.add(auction);
          }
        }
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
    isAllLoading = false;
  }

  makeBid(String auctionId, int price) async {
    ApiResponse apiResponse = await auctionRepo!.makeBid(auctionId, price);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      var data = apiResponse.response?.data;
      if(data['success'] as bool == true){
        Get.snackbar(
          "Bid Placed",
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

  addToWatchList(String auctionId) async {
    ApiResponse apiResponse = await auctionRepo!.addToWatchList(auctionId);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      var data = apiResponse.response?.data;
      if(data['success'] as bool == true){
        Get.snackbar(
          "Added to WatchList",
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

  removeFromWatchList(String auctionId) async {
    ApiResponse apiResponse = await auctionRepo!.removeFromWatchList(auctionId);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      var data = apiResponse.response?.data;
      if(data['success'] as bool == true){
        Get.snackbar(
          "Removed from WatchList",
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