import 'dart:convert';

import 'package:car_auction_new/helper/network_info.dart';
import 'package:car_auction_new/provider/auction_provider.dart';
import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:car_auction_new/provider/localization_provider.dart';
import 'package:car_auction_new/provider/my_wins_provider.dart';
import 'package:car_auction_new/provider/notification_provider.dart';
import 'package:car_auction_new/provider/profile_provider.dart';
import 'package:car_auction_new/provider/splash_provider.dart';
import 'package:car_auction_new/provider/theme_provider.dart';
import 'package:car_auction_new/provider/watchlist_provider.dart';
import 'package:car_auction_new/util/app_constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/model/response/language_model.dart';
import 'data/repository/auction_repo.dart';
import 'data/repository/auth_repo.dart';
import 'data/repository/my_wins_repo.dart';
import 'data/repository/notification_repo.dart';
import 'data/repository/profile_repo.dart';
import 'data/repository/splash_repo.dart';
import 'data/repository/watchlist_repo.dart';

Future<Map<String, Map<String, String>>> init() async {

  // External
  Get.lazyPut(() => Dio());
  Get.lazyPut(() => LoggingInterceptor());
  Get.lazyPut(() => Connectivity());

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => NetworkInfo(Get.find<Connectivity>()));
  Get.lazyPut(() => DioClient(AppConstants.baseUrl, Get.find<Dio>(), loggingInterceptor: Get.find<LoggingInterceptor>(), sharedPreferences: Get.find<SharedPreferences>()));

  // Repository
  Get.lazyPut(() => SplashRepo(sharedPreferences: Get.find<SharedPreferences>(), dioClient: Get.find<DioClient>()));
  Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find<SharedPreferences>(), dioClient: Get.find<DioClient>()));
  Get.lazyPut(() => ProfileRepo(sharedPreferences: Get.find<SharedPreferences>(), dioClient: Get.find<DioClient>()));
  Get.lazyPut(() => AuctionRepo(sharedPreferences: Get.find<SharedPreferences>(), dioClient: Get.find<DioClient>()));
  Get.lazyPut(() => MyWinsRepo(sharedPreferences: Get.find<SharedPreferences>(), dioClient: Get.find<DioClient>()));
  Get.lazyPut(() => WatchlistRepo(sharedPreferences: Get.find<SharedPreferences>(), dioClient: Get.find<DioClient>()));
  Get.lazyPut(() => NotificationRepo(sharedPreferences: Get.find<SharedPreferences>(), dioClient: Get.find<DioClient>()));

  // Provider
  Get.create(() => AuthProvider(authRepo: Get.find<AuthRepo>()));
  Get.create(() => ProfileProvider(profileRepo: Get.find<ProfileRepo>()));
  Get.create(() => AuctionProvider(auctionRepo: Get.find<AuctionRepo>()));
  Get.create(() => MyWinsProvider(myWinsRepo: Get.find<MyWinsRepo>()));
  Get.create(() => WatchlistProvider(watchlistRepo: Get.find<WatchlistRepo>()));
  Get.create(() => NotificationProvider(notificationRepo: Get.find<NotificationRepo>()));
  Get.create(() => SplashProvider(splashRepo: Get.find<SplashRepo>()));
  Get.create(() => LocalizationProvider(dioClient: Get.find<DioClient>(),sharedPreferences: Get.find<SharedPreferences>()));
  Get.create(() => ThemeProvider(sharedPreferences: Get.find<SharedPreferences>()));

  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] = json;
  }
  return languages;
}