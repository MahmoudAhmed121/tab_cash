import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';


class CustomAppbarHome extends StatelessWidget {
   CustomAppbarHome({
     Key? key ,
     required this.image,
     required this.title,
     this.icon1,
     this.icon2,
     this.onPressedIconOne,
     this.onPressedIconTwo,
     this.textRight,

   }) : super(key: key);

  final String image;
  final String title;
  final Icon? icon1;
   final FocusedMenuHolder? icon2;
  final VoidCallback? onPressedIconOne;
  final VoidCallback? onPressedIconTwo;
  final String? textRight;


  @override
  Widget build(BuildContext context) {

    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: heightScreen*0.05,
                  width: widthScreen*0.12,
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(image),
              ),
              Text( title,style: GoogleFonts.josefinSans(textStyle: Style.textStyle24,color: kContainerColor),),
            ],
          ),

          Row(
            children: [
              (icon1 != null) ? IconButton(onPressed: onPressedIconOne, icon: icon1!) : SizedBox(),
              (icon2 != null) ? IconButton(onPressed: onPressedIconTwo, icon: icon2!) : SizedBox(),
            ],
          ),


        ],
      ),
    );
  }
}
