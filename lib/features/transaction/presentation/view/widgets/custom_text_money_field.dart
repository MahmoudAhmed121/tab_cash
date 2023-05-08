import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';

class CustomTextMoneyField extends StatelessWidget {
  const CustomTextMoneyField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: TextInputType.number,
      style: Style.textStyle24.copyWith(color:kContainerColor),
      decoration: InputDecoration(
        hintText: "0",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kDividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kDividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: kTextFormFieldBorder),
        ),
      ),


    );
  }
  }






