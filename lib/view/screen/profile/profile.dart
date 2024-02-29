import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../provider/profile_provider.dart';
import '../../base/app_bar.dart';
import '../../base/drawer.dart';
import '../auth/logout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appbar(
        context,
        scaffoldKey,
        'Profile'
      ),
      drawer: AppDrawer(scaffoldKey: scaffoldKey),
      body: Consumer<ProfileProvider>(
        builder: (context, controller, child) =>  Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    (controller.user?.photo??'')==''
                        ? const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage('assets/images/empty_dp.png'),
                    ):const CircleAvatar(
                      radius: 60,
                      foregroundImage: NetworkImage('controller.user!.photo!'),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          color: Colors.black,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white
                            ),
                            icon: const Icon(Icons.camera_alt),
                          onPressed: () {  },
                        )
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Id: ${controller.user?.id}',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Full Name',
                    style: GoogleFonts.kanit(fontSize: 16, color: Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: ScreenUtil().setWidth(345),
                    height: ScreenUtil().setHeight(25),
                    child: TextFormField(
                      initialValue: controller.user?.fullName,
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      // controller: _firstNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Company Name',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: ScreenUtil().setWidth(345),
                    height: ScreenUtil().setHeight(25),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      initialValue: controller.user?.companyName,
                      // controller: _companyNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: ScreenUtil().setWidth(345),
                    height: ScreenUtil().setHeight(25),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      // controller: _companyNameController,
                      initialValue: controller.user?.email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Mobile Number',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: ScreenUtil().setWidth(345),
                    height: ScreenUtil().setHeight(25),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      // controller: _companyNameController,
                      initialValue: controller.user?.mobile,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'ID Number',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: ScreenUtil().setWidth(345),
                    height: ScreenUtil().setHeight(25),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      initialValue: controller.user?.id,
                      // controller: _companyNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey)
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'PAN Number',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: ScreenUtil().setWidth(345),
                    height: ScreenUtil().setHeight(25),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      // controller: _companyNameController,
                      initialValue: controller.user?.panNumber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.grey)
                        )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Address',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(345),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    // controller: _companyNameController,
                    initialValue: controller.user?.companyAddress,
                    maxLines: 2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed:() async {
                      String? pass = await changePassword();
                      if(pass!=null) {
                        controller.changePassword(pass);
                      }
                    },
                    child: Text(
                      'Change Password?',
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: const Size(179, 45)),
                  onPressed: () {
                    Get.to(()=>const LogoutScreen());
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> changePassword() async {
    String? text;
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        enableDrag: true,
        isDismissible: true,
        context: context,
        elevation: 0,
        builder: (context) {
          double baseWidth = 290;
          double a = Get.width / baseWidth;
          double b = a * 0.97;
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width,
                color: Colors.white,
                padding: EdgeInsets.all(12 * a),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 12 * a,
                      ),
                    ),
                    SizedBox(height: 12 * a),
                    TextField(
                      maxLines: 1,
                      onChanged: (value) {
                        text = value;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFD9D9D9),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 6 * a),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Center(child: Text('Cancel')))),
                        Container(
                            color: Colors.black, width: 1, height: 18 * a),
                        Expanded(
                            child: Center(
                                child: InkWell(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(color: Theme.of(context).primaryColor),
                                  ),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    return text;
  }
}