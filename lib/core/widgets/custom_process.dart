import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../utils/style.dart';

class CustomProcess extends StatelessWidget {
  const CustomProcess({Key? key, required this.title, required this.date, required this.time, required this.money}) : super(key: key);
  final String title;
  final String date ;
  final DateTime time ;
  final String money;


  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      height: heightScreen *0.12,
      width: widthScreen,
      padding: EdgeInsets.all(widthScreen*0.03),
      decoration: BoxDecoration(
        color: ktextWoletColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$title",
                style: GoogleFonts.josefinSans(
                    textStyle: Style.textStyle20,
                    color: kContainerColor,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding:  EdgeInsets.only(left: widthScreen*0.05),
                child: Text(
                  "$date",
                  style: GoogleFonts.josefinSans(
                      textStyle: Style.textStyle18,
                      color: kbackgroundbottomBar,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: widthScreen*0.05),
                child: Text(
                  "$time",
                  style: GoogleFonts.josefinSans(
                      textStyle: Style.textStyle18,
                      color: kbackgroundbottomBar,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Text(
            "\$$money",
            style: GoogleFonts.josefinSans(
                textStyle: Style.textStyle26,
                color: kbackgroundbottomBar,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
