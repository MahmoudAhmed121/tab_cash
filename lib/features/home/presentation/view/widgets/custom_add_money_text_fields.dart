import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';

class CustomAddMoneyTextFields extends StatelessWidget {
  const CustomAddMoneyTextFields({Key? key ,}) : super(key: key);


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
