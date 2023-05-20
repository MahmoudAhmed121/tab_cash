import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/core/utils/app_localizations.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/model/one_payment_model.dart';


class CustomGridViewPayment extends StatelessWidget {
   CustomGridViewPayment({Key? key, }) ;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
        List listOfPayment = [
      OnePaymentModel(name: "Internet".translat(context), image: Images.payment1),
      OnePaymentModel(name: "Electricity".translat(context), image: Images.payment2),
      OnePaymentModel(name: "Voucher".translat(context), image: Images.payment3),
      OnePaymentModel(name: "Assurance".translat(context), image: Images.payment4),
      OnePaymentModel(name: "Credit".translat(context), image: Images.payment5),
      OnePaymentModel(name: "Bill".translat(context), image: Images.payment6),
      OnePaymentModel(name: "Market".translat(context), image: Images.payment7),
      OnePaymentModel(name: "More".translat(context), image: Images.payment8),
    ];
    return Container(
      width: widthScreen,
        height: heightScreen*.25,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
             childAspectRatio: (widthScreen*0.05)/(heightScreen*0.03)

          ),
          itemCount:listOfPayment.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  height: heightScreen*0.07,
                  width: widthScreen*0.15,
                  padding: EdgeInsets.all(widthScreen*0.02),
                  decoration: BoxDecoration(
                    color: kPaymentContainerColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SizedBox(
                      height: heightScreen*0.02,
                      width: widthScreen*0.06,
                      child: SvgPicture.asset(listOfPayment[index].image),
                    //child: Image.asset(listOfPayment[index].image),
                  ),
                ),
                Text(
                    listOfPayment[index].name,
                    style: GoogleFonts.prompt(
                        textStyle: Style.textStyle12,
                        color: kReceiptColor2,
                        fontWeight: FontWeight.w400,
                    ),
                ),
              ],
            );
          }
      ),
    );
  }
}
