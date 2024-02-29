import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleDetailScreen extends StatefulWidget {
  final String title;
  final List<Map<String, Object>> dataList;
  const VehicleDetailScreen({super.key, required this.title, required this.dataList});

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: const TextStyle(color: Colors.white,fontSize: 18),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
          onPressed: () {Get.back();},
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // Sliver app bar that expands and collapses
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            // title: Text(title,style: const TextStyle(color: Colors.white,fontSize: 16)),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                color: Colors.black38,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Row(
                  children: [
                    Text('Tata ace Gold Fully Built',style: TextStyle(color: Colors.white,fontSize: 12)),
                    Spacer(),
                    Icon(Icons.camera_alt_outlined,color: Colors.white,size: 18)
                  ],
                ),
              ),
              titlePadding: EdgeInsets.zero,
              background: Stack(
                children: [
                  Image.asset(
                    'assets/images/dummy/car.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.heart,color: Colors.white,size: 30,),
                        onPressed: () {  },
                      )),
                ],
              ),
              collapseMode: CollapseMode.parallax,
              stretchModes: const [
                StretchMode.fadeTitle,
                StretchMode.zoomBackground
              ],
            ),

          ),

          // Sliver list for the content
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.access_time,size: 17.sp),
                          SizedBox(width: 6.w),
                          Text(
                              'Starts in 2d 22h',
                              style: GoogleFonts.kanit(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300
                              )),
                          const Spacer(),
                          Text(
                              'Auction not Started yet',
                              style: GoogleFonts.kanit(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300
                              )),
                        ],
                      ),
                      SizedBox(height: 18.w),
                      Row(
                        children: [
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for(Map<String, Object> data in widget.dataList.take(5))
                                iconText(data['icon'] as IconData,data['text'] as String)
                            ],
                          )),
                          SizedBox(width: 6.w),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for(Map<String, Object> data in widget.dataList.skip(5))
                                iconText(data['icon'] as IconData,data['text'] as String)
                            ],
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                // if(widget.showBidTile)Text(
                //     'Bids Left 20',
                //     overflow: TextOverflow.ellipsis,
                //     style: GoogleFonts.kanit(
                //         fontSize: 13.sp,
                //         fontWeight: FontWeight.w300
                //     )),
                // if(widget.showBidTile)SizedBox(height: 9.h),
                // if(widget.showBidTile)BidSetter(startingPrice: value,recall: updateValue,enabled: widget.enabledBid),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    // 'controller.keys[index1]',
                    'Basic Details',
                    style: GoogleFonts.kanit(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      // itemCount: controller.notificationList[index1].length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index2) {
                        return ListTile(
                          title: Text(
                            'Detail $index2',
                            // controller.notificationList[index1][index2].title.toString(),
                            style: GoogleFonts.kanit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          subtitle:
                          Text(
                            'null',
                            // controller.notificationList[index1][index2].body.toString(),
                            style: GoogleFonts.kanit(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  iconText(IconData icon, String text) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      children: [
        Icon(icon,
            size: 17.sp,
            color: Colors.black87),
        Text(
            '  $text',
            style: GoogleFonts.kanit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black87
            ))
      ],

    );
  }
}
