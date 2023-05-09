import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'custom_add_money_text_fields.dart';

class CustomAddMoneyBody extends StatelessWidget {
  const CustomAddMoneyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: "Add Money",
        textStyle: GoogleFonts.josefinSans(
            textStyle: Style.textStyle26, color: kContainerColor),
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: heightScreen*0.13,),
            Text(
                "Card Number",
                 style: GoogleFonts.prompt(
                  textStyle: Style.textStyle18, color: kbackgroundbottomBar,fontWeight: FontWeight.w400),
            ),
            CustomAddMoneyTextFields(),

          ],
        ),
      ),
    );
  }
}
