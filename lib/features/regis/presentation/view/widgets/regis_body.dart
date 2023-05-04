import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tab_cach/features/regis/presentation/view/widgets/custom_regis_sheet.dart';
import 'package:tab_cach/features/regis/presentation/view/widgets/custom_send_code_body.dart';

import '../../../../../constant.dart';

class RegisBody extends StatelessWidget {
   RegisBody({super.key});

SendCode sendCode = SendCode();
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: sendCode.appBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
           
            Lottie.asset("assets/animations/53332-bouncing-ball.json",
            height: heightScreen*0.23,
          
            ),
            Expanded(
              child: SlideInUp(
                delay: const Duration(milliseconds: 1200),
                duration: const Duration(milliseconds: 600),
                from: 700,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                        color: kContainerColor,
                      ),
                    ),
                    CustomRegisSheet(
                      text: "Sign Up",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
