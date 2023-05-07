  import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';

AppBar customAppBarforHome() {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: kBackGroundColor,
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Ellipse 7.svg"),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Hi Mahmoud",
            style: GoogleFonts.josefinSans(fontSize: 32),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesome.bell,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(FontAwesome.bar_chart))
        ],
      ),
    );
  }
