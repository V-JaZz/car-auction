import 'package:car_auction_new/provider/auction_provider.dart';
import 'package:car_auction_new/provider/auth_provider.dart';
import 'package:car_auction_new/provider/localization_provider.dart';
import 'package:car_auction_new/provider/my_wins_provider.dart';
import 'package:car_auction_new/provider/notification_provider.dart';
import 'package:car_auction_new/provider/splash_provider.dart';
import 'package:car_auction_new/provider/theme_provider.dart';
import 'package:car_auction_new/provider/watchlist_provider.dart';
import 'package:car_auction_new/theme/dark_theme.dart';
import 'package:car_auction_new/theme/light_theme.dart';
import 'package:car_auction_new/util/app_constants.dart';
import 'package:car_auction_new/util/messages.dart';
import 'package:car_auction_new/view/screen/splash/splash.dart';
import 'package:car_auction_new/view/screen/watchlist/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;
import 'provider/profile_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Get.find<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<ProfileProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<AuctionProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<MyWinsProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<WatchlistProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<NotificationProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<SplashProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<ThemeProvider>()),
        ChangeNotifierProvider(create: (context) => Get.find<LocalizationProvider>())
      ],
  child: MyApp(languages: languages)));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  const MyApp({super.key, this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
          locale: Provider.of<LocalizationProvider>(context).locale,
          fallbackLocale: Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode),
          translations: Messages(languages: widget.languages),
          // defaultTransition: Transition.topLevel,
          // transitionDuration: const Duration(milliseconds: 500),
          // scrollBehavior: const MaterialScrollBehavior().copyWith(
          //   dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          // ),
          home: const SplashScreen()
      ),
    );
  }
}