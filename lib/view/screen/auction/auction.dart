import 'package:car_auction_new/view/screen/auction/filter_auction.dart';
import 'package:car_auction_new/view/screen/auction/sort_auction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../provider/auction_provider.dart';
import '../../../provider/profile_provider.dart';
import '../../base/alertDailog.dart';
import '../../base/app_bar.dart';
import '../../base/auction_list_tile.dart';
import '../../base/drawer.dart';
import '../dashboard/selected_auction_list.dart';

class AuctionScreen extends StatefulWidget {
  final int index;
  const AuctionScreen({this.index = 0, super.key});

  @override
  State<AuctionScreen> createState() => _AuctionScreenState();
}

class _AuctionScreenState extends State<AuctionScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController =
  TabController(initialIndex: widget.index, length: 2, vsync: this);

  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Live',
    ),
    const Tab(text: 'Upcoming'),
  ];
  // final List<Map<String, dynamic>> liveAuctionList = [
  //   {
  //     "title": 'Exclusive Bajaj Salvage Auction',
  //     "countDown": DateTime(2024,4,16),
  //     "insurance": true,
  //     "close": true,
  //     "vehicles": const [
  //       {
  //         "icon" : Icons.fire_truck,
  //         "count" : '6',
  //       }
  //     ],
  //     "bank": false,
  //     "location": null,
  //     "locked" : true
  //   },
  //   {
  //     "title": "ICICI BANK CV&CE Online Auction west 21jun 23",
  //     "countDown": DateTime(2024,1,11),
  //     "insurance": true,
  //     "close": true,
  //     "vehicles": const [
  //       {
  //         "icon" : Icons.fire_truck,
  //         "count" : '1',
  //       },
  //       {
  //         "icon" : Icons.car_crash_outlined,
  //         "count" : '8',
  //       }
  //     ],
  //     "bank": false,
  //     "location": null,
  //     "locked" : true
  //   }
  // ];
  // final List<Map<String, dynamic>> upcomingAuctionList = [
  //   {
  //     "title": 'Exclusive Bajaj Salvage Auction',
  //     "countDown": DateTime(2024,4,16),
  //     "insurance": false,
  //     "close": true,
  //     "vehicles": const [
  //       {
  //         "icon" : Icons.fire_truck,
  //         "count" : '6',
  //       }
  //     ],
  //     "bank": true,
  //     "location": null
  //   }
  // ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // controller = Get.find<HomeController>();
    // controller.getData();
    // tabController.addListener(() {
    //   log('Hello');
    //   controller.isSearchingUpcoming = false;
    //   controller.isSearching = false;
    //   // if(tabController.indexIsChanging){
    //   //   log('Changing tab');
    //   //   controller.isSearchingUpcoming = false;
    //   //   controller.isSearching = false;
    //   // }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        key: scaffoldKey,
        appBar: appbar(
            context,
            scaffoldKey,
            'Auction',
            bottom: PreferredSize(
              preferredSize: Size(double.maxFinite, 40.h),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  controller: tabController,
                  labelStyle: GoogleFonts.kanit(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.amber,
                  indicatorWeight: 2.h,
                  indicatorColor: Colors.yellow,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: myTabs,
                ),
              ),
            ),
        ),
        drawer: AppDrawer(scaffoldKey: scaffoldKey),
        body: Consumer<AuctionProvider>(
          builder: (context, controller, child) =>  Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // Widget for Tab 1
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 5.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  controller.isSearchingLive
                                      ? Expanded(
                                    child: TextFormField(
                                      controller: controller.searchLiveController,
                                      maxLines: 1,
                                      autofocus: true,
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        hintText: 'Search here',
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  )
                                      : Text(
                                    '${controller.liveList.length} Vehicles',
                                    style: GoogleFonts.kanit(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.isSearchingLive = !controller.isSearchingLive;
                                        },
                                        child: Icon(
                                          controller.isSearchingLive ? Icons.close : Icons.search_outlined,
                                          size: 20.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          Get.to(()=>const FilterAuctions(),transition: Transition.rightToLeft);
                                          // var filter = await Get.toNamed(RoutePaths.filterAuction);
                                          // controller.filterList(filter);
                                        },
                                        child: Image.asset(
                                          'assets/images/more.png',
                                          height: 25.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(10).w,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          Get.to(()=>const SortAuctions(),transition: Transition.rightToLeft);
                                          // var filter = await Get.toNamed(RoutePaths.sortAuctionByParm);
                                          // controller.filterList(filter);
                                        },
                                        child: Icon(
                                          Icons.import_export_sharp,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.liveList.length,
                                itemBuilder: (context, index) {
                                  final auc = controller.liveList[index];
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
                            ),
                            SizedBox(height: 25.h),
                          ],
                        ),
                      ),

                      // Widget for Tab 2
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 5.h),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  controller.isSearchingUpcoming
                                      ? Expanded(
                                    child: TextFormField(
                                      controller: controller.searchUpcomingController,
                                      maxLines: 1,
                                      autofocus: true,
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        hintText: 'Search here',
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  )
                                      : Text(
                                    '${controller.upcomingList.length} Vehicles',
                                    style: GoogleFonts.kanit(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.isSearchingUpcoming = !controller.isSearchingUpcoming;
                                          controller.searchUpcomingController.text = '';
                                        },
                                        child: Icon(
                                          controller.isSearchingUpcoming
                                              ? Icons.close
                                              : Icons.search_outlined,
                                          size: 20.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          Get.to(()=>const FilterAuctions(),transition: Transition.rightToLeft);
                                          // var filter = await Get.toNamed(RoutePaths.filterAuction);
                                          // controller.filterList(filter);
                                        },
                                        child: Image.asset(
                                          'assets/images/more.png',
                                          height: 25.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(10).w,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          Get.to(()=>const SortAuctions(),transition: Transition.fadeIn);
                                          // var filter = await Get.toNamed(RoutePaths.sortAuctionByParm);
                                          // controller.filterList(filter);
                                        },
                                        child: Icon(
                                          Icons.import_export_sharp,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.upcomingList.length,
                              itemBuilder: (context, index) {
                                final auc = controller.upcomingList[index];
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
                            SizedBox(height: 25.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}