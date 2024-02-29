import 'dart:async';

import 'package:car_auction_new/provider/profile_provider.dart';
import 'package:car_auction_new/view/base/app_bar.dart';
import 'package:car_auction_new/view/base/auction_list_tile.dart';
import 'package:car_auction_new/view/base/drawer.dart';
import 'package:car_auction_new/view/screen/dashboard/selected_auction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../provider/auction_provider.dart';
import '../../../util/color_resources.dart';
import '../../base/alertDailog.dart';
import '../auction/auction.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    Provider.of<AuctionProvider>(context,listen: false).getAuctionData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool canExit = false;
    return WillPopScope(
      onWillPop: () async {
        if(canExit) {
          return true;
        }else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('press back again to exit', style: TextStyle(color: Colors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).primaryColor,
            duration: const Duration(seconds: 2),
            margin: EdgeInsets.all(10.sp),
          ));
          canExit = true;
          Timer(const Duration(seconds: 2), () {
            canExit = false;
          });
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: ColorResources.getBackgroundGrey(context),
        key: scaffoldKey,
        appBar: appbar(context,scaffoldKey,'Dashboard'),
        drawer: AppDrawer(scaffoldKey: scaffoldKey,isHome: true),
        body: Consumer<AuctionProvider>(
          builder: (context, value, _) => ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Live Auctions(${value.liveList.length})',
                      style: GoogleFonts.kanit(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(()=>const AuctionScreen(index: 0),transition: Transition.fadeIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'VIEW ALL',
                        style: GoogleFonts.kanit(
                          fontSize: 12.sp,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              value.isAllLoading
                  ?ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Shimmer.fromColors(
                          baseColor: ColorResources.getBackgroundGrey(context),
                          highlightColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 9.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 12.h,
                                    width: 120.w,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3)
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                    height: 63.h,
                                    width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  :ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.liveList.length>2 ?2 :value.liveList.length,
                    itemBuilder: (context, index) {
                      final auc = value.liveList[index];
                      return
                        AuctionListTile(
                          onTap: (){
                            final user = Provider.of<ProfileProvider>(context,listen: false);
                            if(user.user?.isApprovedByAdmin == false) {
                              showAlertDailog(
                                  'Alert',
                                  'Selected auction has not been assigned to you. Please Contact us at +916565768767.');
                          }else{
                              Get.to(()=>SelectedAuctionList(
                                auction: auc,
                              ));
                            }
                        },
                          title: auc.seller?.first.name??'null',
                          countDown: auc.endTime??DateTime.now(),
                          insurance: auc.rc??false,
                          close: true,
                          bank: !(auc.rc??false),
                          location: auc.region!.isNotEmpty ? auc.region!.first.name : null,
                          vehicles: [
                            {
                              "icon" : auc.categories?.first.name == 'Bike'?Icons.motorcycle:Icons.car_repair,
                              "count" : '1',
                            },
                          ],
                          preTimer: 'Ends in ',
                        );
                    },
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Upcoming Auctions(${value.upcomingList.length})',
                      style: GoogleFonts.kanit(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(()=>const AuctionScreen(index: 1),transition: Transition.fadeIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'VIEW ALL',
                        style: GoogleFonts.kanit(
                          fontSize: 12.sp,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              value.isAllLoading
                  ?ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Shimmer.fromColors(
                          baseColor: ColorResources.getBackgroundGrey(context),
                          highlightColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 9.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 12.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3)
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  height: 63.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  :ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.upcomingList.length>2 ?2 :value.upcomingList.length,
                    itemBuilder: (context, index) {
                      final auc = value.upcomingList[index];
                      return
                        AuctionListTile(
                          onTap: (){
                            Get.to(()=>SelectedAuctionList(
                              auction: auc,
                            ));
                          },
                          title: auc.seller?.first.name??'null',
                          countDown: auc.startTime??DateTime.now(),
                          insurance: auc.rc??false,
                          close: true,
                          bank: !(auc.rc??false),
                          location: auc.region!.isNotEmpty ? auc.region!.first.name : null,
                          vehicles: [
                            {
                              "icon" : auc.categories?.first.name == 'Bike'?Icons.motorcycle:Icons.car_repair,
                              "count" : '1',
                            },
                          ],
                          preTimer: 'Starts in ',
                        );
                    },
                  ),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
        bottomSheet: Consumer<ProfileProvider>(
          builder: (context, value, _) => SizedBox(
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomView(
                    title: "Deposit",
                    subtitle: 'Coming Soon'
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                bottomView(
                    title: "Buying Limit",
                    subtitle: '₹ ${value.user?.buyingLimit??'0'}'
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                bottomView(
                    title: "Available Limit",
                    subtitle: '₹ ${value.user?.availableLimit??'0'}'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bottomView({required String title, required String subtitle}) {
    return Expanded(child: Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: '$title\n',
            style: GoogleFonts.kanit(
              fontSize: 12.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w300
            ),
            children: [
              TextSpan(
                text: subtitle,
                style: GoogleFonts.kanit(
                  fontSize: 12.sp,
                  color: Colors.amber,
                ),),
            ]
        ),
      ),
    ));
  }
}
