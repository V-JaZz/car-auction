import 'package:car_auction_new/data/model/response/base/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/model/response/all_auction_model.dart';
import '../data/model/response/user_model.dart';
import '../data/repository/auction_repo.dart';
import '../data/repository/my_wins_repo.dart';
import '../helper/api_checker.dart';

class MyWinsProvider extends ChangeNotifier {
  final MyWinsRepo? myWinsRepo;
  MyWinsProvider({required this.myWinsRepo});

  var _isLoading = true;
  var _isSearching = false;

  get isLoading => _isLoading;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  get isSearching => _isSearching;

  set isSearching(value) {
    _isSearching = value;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();

  List<AllAuctionModel> winningItems = <AllAuctionModel>[];

  Future getAllWinnings() async {
    try{
      isLoading = true;
      var res = await myWinsRepo?.getAllWinnings();
      var data = res?.response?.data;
      if(data['status'] == true){
        for(var wishlist in data['data']){
          winningItems.add(wishlist);
        }
      }else{
        Get.snackbar(
          "Auction",
          data['message'],
          backgroundColor: Colors.amberAccent,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          borderRadius: 10.r,
        );
        isLoading = false;
      }
      isLoading = false;
    }catch(err){
      isLoading = false;
      Get.snackbar(
        "Auction",
        'Please check your internet access and try again',
        backgroundColor: Colors.amberAccent,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        borderRadius: 10.r,
      );
    }
  }

  void filterList(filter) {

  }

// @override
  // void onClose() {
  //   refresher.dispose();
  //   super.onClose();
  // }

}