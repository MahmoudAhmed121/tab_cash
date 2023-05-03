import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'features/splach/presentation/view/splach_view.dart';

void main() {
  runApp(const TabCach());
}

class TabCach extends StatelessWidget {
  const TabCach({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackGroundColor,
          textTheme: GoogleFonts.promptTextTheme()),
      home: SplachView(),
    );
  }
}
