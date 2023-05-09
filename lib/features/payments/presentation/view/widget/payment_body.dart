import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';

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
              "Payment",
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
                decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                ),
                child: Column(
                  children: [


                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
