
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/core/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/transaction/presentation/view/widgets/custom_receipt.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'custom_text_money_field.dart';

class CustomSendMoneyContact extends StatelessWidget {
  const CustomSendMoneyContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
          context,
          title:"Send Money",
          textStyle: GoogleFonts.josefinSans( textStyle: Style.textStyle26, color: kContainerColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.09).copyWith(
              top: heightScreen * 0.07),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              /*Text(
              "Send Money",
              style: GoogleFonts.josefinSans( textStyle: Style.textStyle26, color: kContainerColor),
            ),*/
            //SizedBox(height: heightScreen * 0.1,),
            SizedBox(
              height: heightScreen * 0.18,
              width: widthScreen * 0.4,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/4.png"),
              ),
            ),

            SizedBox(height: heightScreen * 0.05,),
            Text(
              "Send Money",
              style: GoogleFonts.prompt(
                  textStyle: Style.textStyle16, color: kPinInActiveBorder),
            ),
            SizedBox(height: heightScreen * 0.01,),
            Text(
              "Send Money",
              style: GoogleFonts.prompt(
                  textStyle: Style.textStyle26, color: kContainerColor),
            ),
            SizedBox(height: heightScreen * 0.08,),

            CustomTextMoneyField(),


            SizedBox(height: heightScreen*0.1,),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                Get.to(CustomReceipt());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPinInActiveField,
                fixedSize: Size(widthScreen * 0.37, heightScreen * 0.08),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Send',
                style: Style.textStyle20.copyWith(color: kBackGroundColor),),
            ),
          ),


          ],
        ),
    ),),
      )
    ,
    );
  }
}
