import 'package:car_auction_new/view/screen/notification/notification.dart';
import 'package:car_auction_new/view/screen/watchlist/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/profile_provider.dart';
import '../screen/auction/auction.dart';
import '../screen/auth/logout.dart';
import '../screen/dashboard/dashboard.dart';
import '../screen/help/help.dart';
import '../screen/my_wins/my_wins.dart';
import '../screen/payment/payment.dart';
import '../screen/profile/profile.dart';
import '../screen/terms_condition/terms_condition.dart';

class AppDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool? isHome;
  const AppDrawer({super.key, required this.scaffoldKey, this.isHome});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).highlightColor,
      surfaceTintColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                Expanded(
                    child: Align(alignment: Alignment.centerLeft,child: Image.asset('assets/images/app_logo.png'))),
                Expanded(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(userInfo(context),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.kanit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).highlightColor,
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
          DrawerListTile(
              onTap: (){
                scaffoldKey.currentState?.closeDrawer();
                if((isHome??false)==false)Get.offAll(()=>Dashboard(),transition: Transition.fadeIn);
              },
              image: 'assets/images/drawer_ic/ic_home.png',
              title: 'Dashboard'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(const AuctionScreen(index: 0));
              },
              image: 'assets/images/drawer_ic/ic_auction.png',
              title: 'Auction'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(const NotificationScreen());
              },
              image: 'assets/images/drawer_ic/ic_notification.png',
              title: 'Notification'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(const ProfileScreen());
              },
              image: 'assets/images/drawer_ic/ic_profile.png',
              title: 'Profile'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(const MyWinsScreen());
              },
              image: 'assets/images/drawer_ic/ic_my_win.png',
              title: 'My Win'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(const WatchlistScreen());
              },
              image: 'assets/images/drawer_ic/ic_watchlist.png',
              title: 'Watchlist'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(TermsScreen());
              },
              image: 'assets/images/drawer_ic/ic_terms.png',
              title: 'Term & Conditions'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(const PaymentScreen());
              },
              image: 'assets/images/drawer_ic/ic_payment.png',
              title: 'Payment'
          ),
          DrawerListTile(
              onTap: (){
                _goTo(const HelpScreen());
              },
              image: 'assets/images/drawer_ic/ic_help.png',
              title: 'Help'
          ),
          DrawerListTile(
              onTap: () {
                _goTo(const LogoutScreen());
              },
              image: 'assets/images/drawer_ic/ic_logout.png',
              title: 'Log Out'
          ),
        ],
      ),
    );
  }

  String userInfo(BuildContext context) {
    final user = Provider.of<ProfileProvider>(context,listen: false).user;
    return '${user?.fullName}\n${user?.email}';
  }

  void _goTo(dynamic page) {
    scaffoldKey.currentState?.closeDrawer();
    if(isHome==true){
      Get.to(page,transition: Transition.fadeIn);
    }else{
      Get.off(page,transition: Transition.fadeIn);
    }
  }
}

class DrawerListTile extends StatelessWidget {
  final String image;
  final String title;
  final void Function() onTap;
  const DrawerListTile({super.key, required this.image, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Theme.of(context).primaryColor,
      tileColor: Theme.of(context).highlightColor,
      leading: Image.asset(
        image,
        height: 21.w,
        width: 21.w,
      ),
      title: Text(
          title,
          style: GoogleFonts.kanit(
              fontSize: 15.sp
          )),
      onTap: onTap,
    );
  }
}
