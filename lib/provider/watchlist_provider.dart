import 'package:car_auction_new/data/model/response/base/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/model/response/all_auction_model.dart';
import '../data/model/response/user_model.dart';
import '../data/model/response/watchlist_model.dart';
import '../data/repository/auction_repo.dart';
import '../data/repository/my_wins_repo.dart';
import '../data/repository/watchlist_repo.dart';
import '../helper/api_checker.dart';

class WatchlistProvider extends ChangeNotifier {
  final WatchlistRepo? watchlistRepo;
  WatchlistProvider({required this.watchlistRepo});

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

  List<WatchListModel> watchList = <WatchListModel>[];

  // onLoadWinList() async {
  //   getAllWinListItems().then((_) => refresher.refreshCompleted());
  // }

  Future getAllWatchList() async {
    try{
      isLoading = true;
      var res = await watchlistRepo?.getAllWatchList();
      var data = res?.response?.data;
      if(res?.response?.data != null && data['status'] == true){
        watchList = watchListModelFromJson(data['data']);
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
        "Error!",
        err.toString(),
        backgroundColor: Colors.amberAccent,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        borderRadius: 10.r,
      );
    }
  }

}