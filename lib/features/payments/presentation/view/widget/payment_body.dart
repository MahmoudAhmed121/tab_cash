import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/core/utils/app_localizations.dart';
import 'package:tab_cach/features/payments/presentation/view/widget/custom_slider_discount.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import 'custom_gridview_payment.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: heightScreen*0.07,),

          Center(
            child: Text(
              "Payment".translat(context),
              style: GoogleFonts.prompt(
                  textStyle: Style.textStyle30,
                  color: kContainerColor,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),

          SizedBox(height: heightScreen*0.05,),

          Expanded(
              child: Container(
                width: widthScreen,
                padding: EdgeInsets.only(top: heightScreen*0.08,),
                decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.08),
                      child: Column(
                        children: [
                          Text(
                            "Payment List".translat(context),
                            style: GoogleFonts.prompt(
                                textStyle: Style.textStyle18,
                                color: kReceiptColor2,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: heightScreen*0.02,),
                          CustomGridViewPayment(),
                          SizedBox(height: heightScreen*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Discount".translat(context),
                                   style: GoogleFonts.prompt(
                                      textStyle: Style.textStyle18,
                                      color: kBackGroundColor,
                                      fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                "See more".translat(context),
                                style: GoogleFonts.prompt(
                                    textStyle: Style.textStyle14,
                                    color: kButtomBack,
                                    fontWeight: FontWeight.w600
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: heightScreen*0.03,),
                        ],
                      ),
                    ),

                    CustomSliderDiscount(),

                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
