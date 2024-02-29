import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

class FilterAuctions extends StatefulWidget {
  const FilterAuctions({super.key});

  @override
  State<FilterAuctions> createState() => _FilterAuctionsState();
}

class _FilterAuctionsState extends State<FilterAuctions> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.amber,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
            onPressed: (){
              Get.back();
            }
        ),
        title: Text(
          'Filter',
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(CupertinoIcons.line_horizontal_3_decrease),
                    Text(
                      '    Filter',
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ],
                ),
                const Icon(CupertinoIcons.arrow_counterclockwise),
              ],
            ),
          ),
          const Expanded(child: VerticalTabb()),
          Container(
            height: 40.h,
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 170,
                    color: Colors.grey.withOpacity(0.4),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 170,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Apply Filter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VerticalTabb extends StatefulWidget {
  const VerticalTabb({super.key});

  @override
  State<VerticalTabb> createState() => _VerticalTabbState();
}

class _VerticalTabbState extends State<VerticalTabb> {
  bool _checkbox = false;
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  bool _checkbox6 = false;
  bool _checkbox7 = false;
  bool _checkbox8 = false;
  bool _checkbox9 = false;
  bool _checkbox10 = false;
  bool _checkbox11 = false;
  bool _checkbox12 = false;
  bool _checkbox13 = false;

  @override
  Widget build(BuildContext context) {
    return VerticalTabs(
      tabsWidth: 120.w,
      tabsElevation: 0,
      selectedTabBackgroundColor:
      const Color.fromARGB(255, 171, 80, 73).withOpacity(0.1),
      tabs: <Tab>[
        Tab(
          child: SizedBox(
            height: 50,
            child: Text(
              'Location',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
        Tab(
          child: SizedBox(
            height: 50,
            child: Text(
              'Vehicle Type',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
        Tab(
          child: SizedBox(
            height: 50,
            child: Text(
              'Auction Type',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
        Tab(
          child: SizedBox(
            height: 50,
            child: Text(
              'Business Type',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ],
      contents: <Widget>[
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _checkbox13,
                  onChanged: (newVal) {
                    setState(() {
                      _checkbox13 = newVal!;
                    });
                  },
                ),
                Text(
                  'Rewari',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _checkbox,
                  onChanged: (newVal) {
                    setState(() {
                      _checkbox = newVal!;
                    });
                  },
                ),
                Text(
                  '2 Wheeler',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox1,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox1 = newValue!;
                    });
                  },
                ),
                Text(
                  '3 Wheeler',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox2,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox2 = newValue!;
                    });
                  },
                ),
                Text(
                  '4 Wheeler',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox3,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox3 = newValue!;
                    });
                  },
                ),
                Text(
                  'Commercial Equipment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox4,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox4 = newValue!;
                    });
                  },
                ),
                Text(
                  'Commercial Vehicle',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox5,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox5 = newValue!;
                    });
                  },
                ),
                Text(
                  'Construction Equipment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox6,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox6 = newValue!;
                    });
                  },
                ),
                Text(
                  'E-RickShaw',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox7,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox7 = newValue!;
                    });
                  },
                ),
                Text(
                  'Farm Equipment',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox8,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox8 = newValue!;
                    });
                  },
                ),
                Text(
                  'Passing Carrying Vehicle',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _checkbox9,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox9 = newValue!;
                    });
                  },
                ),
                Text(
                  '  Close',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox10,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox10 = newValue!;
                    });
                  },
                ),
                Text(
                  '  Open',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _checkbox11,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox11 = newValue!;
                    });
                  },
                ),
                Text(
                  'Bank',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _checkbox12,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkbox12 = newValue!;
                    });
                  },
                ),
                Text(
                  'Insurance',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class VerticalTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const VerticalTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105,
        color: isSelected ? const Color.fromARGB(255, 216, 214, 214) : null,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
