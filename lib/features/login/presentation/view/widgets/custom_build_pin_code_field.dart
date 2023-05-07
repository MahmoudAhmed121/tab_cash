import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constant.dart';


class CustomBuildPinCodeField extends StatelessWidget {
   CustomBuildPinCodeField({Key? key}) : super(key: key);
  late String otpCode ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        autoFocus: true,
        obscureText: false,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 38,
          fieldWidth: 33,
          borderWidth: 2,
          activeColor:kPinActiveBorder,
          inactiveColor:kPinInActiveBorder,
          activeFillColor: kContainerColor,
          inactiveFillColor: kContainerColor,
          selectedColor: kPinActiveBorder,
          selectedFillColor: kContainerColor,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: kContainerColor,
        enableActiveFill: true,
        onCompleted: (submittedCode) {
          otpCode = submittedCode;
        },
        onChanged: (value) {
          print(value);

        },
      ),
    );
  }
}
