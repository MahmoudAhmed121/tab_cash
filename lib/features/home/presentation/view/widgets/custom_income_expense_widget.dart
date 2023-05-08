import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';

class CustomIncomeExpense extends StatelessWidget {
   CustomIncomeExpense({Key? key , required this.name ,required this.money }) : super(key: key);
  final String name;
  final String money;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return  Container(
      height: heightScreen*0.082,
      width: widthScreen*0.36,
      decoration: BoxDecoration(
        color:kContainerColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("$name",style: GoogleFonts.josefinSans(textStyle: Style.textStyle24,color: ktextWoletColor),),
          Text("$money",style: GoogleFonts.josefinSans(textStyle: Style.textStyle16,color: kButtomBack),),
        ],
      ),
    );
  }
}
