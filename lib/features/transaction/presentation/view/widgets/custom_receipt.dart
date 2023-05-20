import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tab_cach/core/utils/app_localizations.dart';
import 'package:tab_cach/core/widgets/custom_appbar.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import '../../../../bottom_bar/presentation/view/bottom_nav_bar.dart';
import 'custom_row_receipt.dart';

class CustomReceipt extends StatelessWidget {
  const CustomReceipt({Key? key, required this.dateTime, required this.number, required this.amount, required this.image, required this.name}) : super(key: key);
final DateTime dateTime;
final String number;
final String amount;
final String image;
final String name;
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:CustomAppBar(
        context,
        title:"Receipt".tr,
        textStyle: GoogleFonts.josefinSans( textStyle: Style.textStyle26, color: kContainerColor),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.085),
        child: Column(
          children: [
            SizedBox(height: heightScreen*0.04,),
            Container(
              height: heightScreen*0.63,
              width: widthScreen,
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.all(Radius.circular(20),),
              ),
              child: Column(
                children: [
                  Container(
                    height:heightScreen * 0.15,
                    width: widthScreen *0.4,
                      margin: EdgeInsets.only(bottom: heightScreen*0.013),
                      child: Lottie.asset("assets/animations/88860-success-animation.json"),
                  ),
                  Text(
                    "Transfer Successful!".translat(context),
                    style:Style.textStyle18.copyWith(color:kBackGroundColor,fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height:heightScreen*0.01,),
                  Text(
                    "Your money has been transfered successfuly!".translat(context),
                    style:Style.textStyle12.copyWith(color:kReceiptColor,fontWeight: FontWeight.w600),textAlign: TextAlign.center,
                  ),
                  SizedBox(height:heightScreen*0.02,),
                  Divider(thickness: 1,color: kPinInActiveField,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.04),
                    child: CustomRowReceipt(textOne:"Transfer Amount".translat(context) ,textTwo:"\$ ${amount}" ,),
                  ),

                  Container(
                    height: heightScreen*0.08,
                    width: widthScreen*0.7,
                    padding: EdgeInsets.symmetric(horizontal: widthScreen*0.04,vertical: heightScreen*0.012),
                    margin: EdgeInsets.only(top: heightScreen*0.021,bottom: heightScreen*0.03),
                    decoration: BoxDecoration(
                      border: Border.all(color: kPinInActiveField),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: heightScreen * 0.05,
                          width: widthScreen * 0.1,
                          padding: EdgeInsets.only(right: widthScreen*0.02),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(image),
                          ),
                        ),
                        Text(name,style: Style.textStyle12.copyWith(color:kReceiptColor2,fontWeight: FontWeight.w600 )),
                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.04),
                    child: CustomRowReceipt(textOne:"Data & time".translat(context) ,textTwo:"$dateTime" ,),
                  ),
                  SizedBox(height: heightScreen*0.021,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.04),
                    child: CustomRowReceipt(textOne:"No. Ref" ,textTwo:"$number",),

                  ),
                  SizedBox(height: heightScreen*0.025,),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: widthScreen*0.03),
                      decoration: BoxDecoration(
                        color: kReceiptColor3,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "See Detail ".translat(context),
                            style: GoogleFonts.roboto( textStyle: Style.textStyle12, color: kReceiptColor5,fontWeight: FontWeight.w600),
                          ),

                          Icon(Icons.keyboard_arrow_down,size: 30,color: kReceiptColor4,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: heightScreen*0.05,),

            ElevatedButton(
              onPressed: () {
                Get.to(BottomNavBarView(),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtomBack,
                fixedSize: Size(widthScreen * 0.8, heightScreen * 0.06),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text('Home ',
                style: GoogleFonts.inter( textStyle: Style.textStyle20, color: kContainerColor),
            ),


            ),
          ],
        ),
      ),
    );
  }
}
