
import '../data/model/response/language_model.dart';

class AppConstants {

  static const String appName = 'Car App';
  static const String baseUrl = 'http://13.48.45.18:4008';
  static const String fontFamily = 'Roboto';

  // sharePreference
  static const String token = 'token';
  static const String userID = 'userID';
  static const String intro = 'car_app_intro';
  static const String theme = 'theme';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';

  //uri - api end points
  static const String configUri = '/api/v1/config';
  static const String getUserUri = '/user/get/';
  static const String getAllAuctionUri = '/admin/auction/getAll';
  static const String getWatchListUri = '/user/watchList/get/';
  static const String getMyWinUri = '/bid/getMyWonAuction/';
  static const String notificationsUri = '/notification/get';
  static const String addBidUri = '/bid/add';
  static const String resetPasswordUri = '/user/reset-password';
  static const String sendOtpUri = '/user/send-otp/';
  static const String getUserMobileUri = '/user/get-user/';
  static const String addToWatchListUri = '/user/watchList/add';
  static const String removeFromWatchListUri = '/user/watchList/remove';
  static const String verifyOtpUri = '/user/otp/verify';
  static const String emailLoginUri = '/user/login';
  static const String signUpUri = '/user/create';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en')
  ];
}