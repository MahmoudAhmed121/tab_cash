// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';

class CustomTextMoneyField extends StatelessWidget {
  CustomTextMoneyField({
    super.key,
    required this.validator,
    required this.textEditingController
  });
final String? Function(String?) validator;
final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,
      controller: textEditingController,
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






