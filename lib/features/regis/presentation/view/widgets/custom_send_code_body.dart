import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/login/presentation/view/widgets/custom_otp_code.dart';

import '../../../../../core/widgets/appbar.dart';

class SendCode extends StatefulWidget {
  const SendCode();

  @override
  State<SendCode> createState() => _SendCodeState();
}
@override
void initState() {
 
  Future.delayed(Duration(seconds: 2),_navigator);
}

void _navigator(){
  Get.to(CustomOtpCode());
}
class _SendCodeState extends State<SendCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 368,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: kContainerColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A PIN will be send to you",
                    style: Style.textStyle26.copyWith(
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Lottie.asset("assets/animations/loading.json",
                  height: 100
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 
}
