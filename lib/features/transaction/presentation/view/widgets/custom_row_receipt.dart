import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';

class CustomRowReceipt extends StatelessWidget {
  const CustomRowReceipt({Key? key , required this.textOne,required this.textTwo}) : super(key: key);
  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$textOne",
          style: GoogleFonts.roboto( textStyle: Style.textStyle12, color: kReceiptColor,fontWeight: FontWeight.w600),
        ),
        Text(
          "$textTwo",
          style: GoogleFonts.roboto( textStyle: Style.textStyle12, color: kReceiptColor2,fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
