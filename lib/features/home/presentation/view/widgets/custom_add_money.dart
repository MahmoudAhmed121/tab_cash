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
            SizedBox(height: heightScreen*0.08,),
            CustomAddMoneyTextFields(
              title: "Card Number",
              hintText: "1234 1234 1234 1234",
              heightField: heightScreen*0.07,
              widthField: widthScreen*0.8,
            ),

            SizedBox(height: heightScreen*0.06,),

            Row(
              children: [

                CustomAddMoneyTextFields(
                  title: "EXPIRATION",
                  hintText: "MM/YY",
                  heightField: heightScreen*0.07,
                  widthField: widthScreen*0.5,
                ),

                SizedBox(width: widthScreen*0.06,),

                CustomAddMoneyTextFields(
                  title: "CVC",
                  hintText: "CVC",
                  heightField: heightScreen*0.07,
                  widthField: widthScreen*0.23,
                ),
              ],
            ),

            SizedBox(height: heightScreen*0.075,),

            CustomAddMoneyTextFields(
              title: "Amount",
              hintText: "\$0",
              heightField: heightScreen*0.07,
              widthField: widthScreen*0.8,
            ),


            Spacer(),

            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtomBack,
                fixedSize: Size(widthScreen * 0.8, heightScreen * 0.06),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text('Sdd Money ',
                style: GoogleFonts.inter( textStyle: Style.textStyle20, color: kContainerColor),
              ),

            ),


            SizedBox(height: heightScreen*0.07,),


          ],
        ),
      ),
    );
  }
}
