import 'package:car_auction_new/data/model/response/notification_model.dart';
import 'package:car_auction_new/view/screen/notification/widget/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../provider/notification_provider.dart';
import '../../base/app_bar.dart';
import '../../base/drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'By Date'),
    const Tab(text: 'By Type'),
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    Provider.of<NotificationProvider>(context,listen: false).getAllNotifications();
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
          'Notification',
          bottom: PreferredSize(
            preferredSize: Size(double.maxFinite, 40.h),
            child: Container(
              color: Colors.white,
              child: TabBar(
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
        body: Consumer<NotificationProvider>(
          builder: (context, controller, child) =>  Scaffold(
            body: TabBarView(
              children: [
                // Widget for Tab 1
                SingleChildScrollView(
                  child: controller.groupedNotificationsByDate==null
                      ? Container(
                    alignment: Alignment.bottomCenter,
                      height: 100,
                      child: const CircularProgressIndicator())
                      :ListView.builder(
                      itemCount: controller.groupedNotificationsByDate?.length,
                      // itemCount: controller.keys.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index1) {
                        List<String?> keys = controller.groupedNotificationsByDate!.keys.toList();
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: ExpansionTile(
                            initiallyExpanded: false,
                            title: Text(
                              // 'controller.keys[index1]',
                              keys[index1]??'null',
                              style: GoogleFonts.kanit(
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.groupedNotificationsByDate?[keys[index1]]?.length,
                                // itemCount: controller.notificationList[index1].length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index2) {
                                  NotificationModel? notifications = controller.groupedNotificationsByDate?[keys[index1]]![index2];
                                  return NotificationTile(
                                    title: notifications?.title??'null',
                                    body: notifications?.body??'null',
                                    dateTime: notifications?.createdAt??DateTime.now(),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),

                // Widget for Tab 2
                SingleChildScrollView(
                  child: controller.groupedNotificationsByTitle==null
                      ? Container(
                      alignment: Alignment.bottomCenter,
                      height: 100,
                      child: const CircularProgressIndicator())
                      :ListView.builder(
                      itemCount: controller.groupedNotificationsByTitle?.length,
                      // itemCount: controller.keys.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index1) {
                        List<String?> keys = controller.groupedNotificationsByTitle!.keys.toList();
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: ExpansionTile(
                            initiallyExpanded: false,
                            title: Text(
                              // 'controller.keys[index1]',
                              keys[index1]??'null',
                              style: GoogleFonts.kanit(
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.groupedNotificationsByTitle?[keys[index1]]?.length,
                                // itemCount: controller.notificationList[index1].length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index2) {
                                  NotificationModel? notifications = controller.groupedNotificationsByTitle?[keys[index1]]![index2];
                                  return NotificationTile(
                                    title: notifications?.title??'null',
                                    body: notifications?.body??'null',
                                    dateTime: notifications?.createdAt??DateTime.now(),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
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