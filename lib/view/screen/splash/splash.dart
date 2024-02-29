import 'dart:async';
import 'package:car_auction_new/util/images.dart';
import 'package:car_auction_new/view/screen/auth/login_email.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/profile_provider.dart';
import '../../../provider/splash_provider.dart';
import '../../base/no_internet_screen.dart';
import '../auth/widgets/custom_screen_decoration.dart';
import '../dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  StreamSubscription<ConnectivityResult>? _onConnectivityChanged;

  @override
  void initState() {
    super.initState();

    bool firstTime = true;
    _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(!firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
        isNotConnected ? const SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected ? 'no_connection'.tr : 'connected'.tr,
            textAlign: TextAlign.center,
          ),
        ));
        // if(!isNotConnected) {
        //   _route();
        // }
      }
      firstTime = false;
    });

    // _route();
  }

  void _route() {
    // Provider.of<SplashProvider>(context, listen: false).initConfig(context).then((bool isSuccess) {
    //   if(isSuccess) {
        Provider.of<SplashProvider>(context, listen: false).initSharedPrefData();
        Timer(const Duration(seconds: 0), () {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
            Provider.of<ProfileProvider>(context, listen: false).getUserInfo();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Dashboard()));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginEmail()));
          }
        });
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Provider.of<SplashProvider>(context).hasConnection
          ? CustomScreenDecoration(
          isGradient: true,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 200,
                child: Image.asset(
                  Images.splashLogo,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                iconSize: 46,
                onPressed: _route,
              ),
            ],
      ))
          : const NoInternetOrDataScreen(isNoInternet: true, child: SplashScreen()),
    );
  }
}
