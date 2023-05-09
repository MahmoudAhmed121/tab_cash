import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/core/widgets/custom_process.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import 'custom_list_of_history.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:widthScreen*0.042).copyWith(top: heightScreen*0.07),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "History",
                  style: GoogleFonts.josefinSans(
                      textStyle: Style.textStyle30,
                      color: kContainerColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "See All  ",
                  style: GoogleFonts.inter(
                      textStyle: Style.textStyle16,
                      color: kPinInActiveBorder,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: heightScreen*0.05,),
            CustomListOfHistory(),
          ],
        ),
      ),
    );
  }
}
