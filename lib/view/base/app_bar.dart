import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
AppBar appbar(
    BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey,
    String title,
    {PreferredSizeWidget? bottom}
    ){
  return AppBar(
    backgroundColor: Theme.of(context).primaryColor,
    foregroundColor: Theme.of(context).highlightColor,
    leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: (){
          scaffoldKey.currentState?.openDrawer();
        }
    ),
    title: Text(
      title,
      style: GoogleFonts.kanit(
          fontSize: 18.sp
      ),
    ),
    bottom: bottom,
  );
}
