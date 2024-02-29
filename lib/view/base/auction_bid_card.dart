import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'countdown.dart';

class AuctionBidCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String? timerText;
  final String? preTimer;
  final DateTime? timer;
  final TextEditingController bidController;
  final bool showBidTile;
  final bool? enabledBid;
  final List<Map<String, Object>> dataList;
  final void Function()? onTap;
  const AuctionBidCard({super.key, required this.imageUrl, this.timerText, required this.bidController, required this.showBidTile, this.enabledBid, this.onTap, required this.dataList, required this.title, this.timer, this.preTimer});

  @override
  State<AuctionBidCard> createState() => _AuctionBidCardState();
}

class _AuctionBidCardState extends State<AuctionBidCard> {
  int value = 77000;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 12.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time,size: 13.sp),
                      SizedBox(width: 6.w),
                      widget.timer != null
                          ?CountDownWidget(countDown:widget.timer!,pre: widget.preTimer!)
                          :Text(
                            widget.timerText??'',
                            style: GoogleFonts.kanit(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w300
                            )),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kanit(
                          fontSize: 13.sp
                      )),
                  SizedBox(height: 6.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Stack(
                          children: [
                            Image.asset(
                                'assets/images/dummy/car.jpeg',
                              width: Get.width/4,
                              fit: BoxFit.contain,
                              alignment: Alignment.topCenter,
                            ),
                            Positioned(
                                right: 2.w,
                                top: 1.h,
                                child: InkWell(
                                  onTap: toggleWatchlist,
                                    child: Icon(getIcon(),color: Colors.white))
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(Map<String, Object> data in widget.dataList.take(5))
                          iconText(data['icon'] as IconData,data['text'] as String)
                        ],
                      )),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(Map<String, Object> data in widget.dataList.skip(5))
                            iconText(data['icon'] as IconData,data['text'] as String)
                        ],
                      )),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Text(
                      'Bids Left 20',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kanit(
                          fontSize: 12.sp,
                        fontWeight: FontWeight.w300
                      )),
                ],
              ),
            ),
            if(widget.showBidTile)SizedBox(height: 3.h),
            if(widget.showBidTile)BidSetter(startingPrice: value,recall: updateValue,enabled: widget.enabledBid),
          ],
        ),
      ),
    );
  }

  iconText(IconData icon, String text) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      children: [
        Icon(icon,
            size: 16.sp,
            color: Colors.black87),
        Expanded(
          child: Text(
              ' $text',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.kanit(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87
              )),
        )
      ],

    );
  }

  updateValue(int i){
    setState(() {
      value = i;
    });
  }

  IconData getIcon(){
    IconData icon = isLiked?CupertinoIcons.heart_fill:CupertinoIcons.heart;
    return icon;
  }

  toggleWatchlist(){
    setState(() {
      isLiked = !isLiked;
    });
  }

}

class BidSetter extends StatelessWidget {
  final bool? enabled;
  final int startingPrice;
  final void Function(int) recall;
  const BidSetter({super.key, required this.startingPrice, required this.recall, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 24.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26)
            ),
            child: Row(
              children: [
                SizedBox(width: 9.w),
                InkWell(
                  onTap: (){
                    if(enabled!=false)recall(startingPrice-1000);
                  },
                  child: Icon(Icons.remove_circle_outline,
                      size: 16.sp),
                ),
                SizedBox(width: 9.w),
                Expanded(child: Text(
                  '₹$startingPrice',
                  textAlign: TextAlign.center,
                )),
                SizedBox(width: 9.w),
                InkWell(
                  onTap: (){
                    if(enabled!=false)recall(startingPrice+1000);
                  },
                  child: Icon(Icons.add_circle_outline,
                      size: 16.sp),
                ),
                SizedBox(width: 9.w),
              ],
            ),
          ),
        ),
        Container(
          height: 24.h,
          width: 54.w,
          color: enabled!=false?Colors.red:Colors.red.withOpacity(0.5),
          child:
          Center(
            child: Text(
                'BID',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.kanit(
                    fontSize: 13.sp,
                  color: Colors.white
                )),
          ),
        )
      ],
    );
  }
}

