import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../provider/my_wins_provider.dart';
import '../../../provider/profile_provider.dart';
import '../../base/app_bar.dart';
import '../../base/auction_bid_card.dart';
import '../../base/drawer.dart';
import '../auction/filter_auction.dart';
import '../auction/sort_auction.dart';

class MyWinsScreen extends StatefulWidget {
  const MyWinsScreen({super.key});

  @override
  State<MyWinsScreen> createState() => _MyWinsScreenState();
}

class _MyWinsScreenState extends State<MyWinsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  RefreshController refresher = RefreshController();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500),(){
      refresher.requestRefresh();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MyWinsProvider>(
      builder: (context, controller, child) =>
          Scaffold(
            key: scaffoldKey,
            appBar: appbar(
                context,
                scaffoldKey,
                'My Wins',
              bottom: PreferredSize(
                preferredSize: Size(double.maxFinite, 38.h),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.isSearching
                          ? Expanded(
                        child: TextFormField(
                          controller: controller.searchController,
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
                        '2 Vehicles',
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
                              controller.isSearching = !controller.isSearching;
                            },
                            child: Icon(
                              controller.isSearching ? Icons.close : Icons.search_outlined,
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
                  )
                ),
              ),
            ),
            drawer: AppDrawer(scaffoldKey: scaffoldKey),
            body: Container(
                color: Colors.grey[200],
                child: SmartRefresher(
                  enablePullDown: true,
                  onRefresh:  (){
                    controller.getAllWinnings().then((_) => refresher.refreshCompleted());
                  },
                  physics: const BouncingScrollPhysics(),
                  header: const WaterDropMaterialHeader(),
                  controller: refresher,
                  child: ListView.builder(
                      itemCount: controller.winningItems.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        final item = controller.winningItems[index];
                        return AuctionBidCard(
                          title: item.productName??'',
                          imageUrl: item.photoVideo!.isEmpty
                              ? 'https://i.postimg.cc/mg0hKBTM/car.jpg'
                              : item.photoVideo!.first,
                          timerText: 'Won on ${formatDateTime(item.endTime!)}',
                          bidController: TextEditingController(text: '0'),
                          enabledBid: false,
                          showBidTile: false,
                          dataList: [
                            {'icon': Icons.confirmation_number_outlined, 'text': item.registrationNumber??''},
                            {'icon': Icons.calendar_month_outlined, 'text': 'Mfg ${item.yearOfManufacture??''}'},
                            const {'icon': Icons.calendar_month_outlined, 'text': 'Repo 19 May 23'},
                            const {'icon': Icons.calendar_month_outlined, 'text': 'LDD:N/A'},
                            const {'icon': Icons.calendar_month_outlined, 'text': 'Reg:N/A'},
                            {'icon': Icons.calendar_month_outlined, 'text': 'RC: ${item.rc}'},
                            const {'icon': Icons.local_gas_station_outlined, 'text': 'Diesel'},
                            const {'icon': Icons.location_on_outlined, 'text': 'N/A'},
                            {'icon': Icons.calendar_month_outlined, 'text': item.agreementNumber??''},
                            {'icon': Icons.currency_rupee_outlined, 'text': 'Reserve ₹${item.reservePrice}'},
                            // Add more items as needed
                          ],
                        );
                      }),
                )
            ),
          ),
    );
  }
  String formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('MM-dd-yyyy');
    return formatter.format(dateTime);
  }
}