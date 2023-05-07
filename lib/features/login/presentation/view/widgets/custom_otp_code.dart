import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/features/login/view/widgets/custom_build_pin_code_field.dart';

import '../../../../constant.dart';
import '../../../../core/utils/style.dart';
import '../../../regis/presentation/view/widgets/custom_send_code_body.dart';
import 'custom_buttom.dart';


class CustomOtpCode extends StatelessWidget {
   CustomOtpCode({Key? key}) : super(key: key);

  final SendCode sendCode = SendCode();

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:widthScreen*0.08 ,vertical: heightScreen*0.1),
              child: Container(
                height: heightScreen*0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: kContainerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 80,),
                    Text(
                      "Enter Code",
                      style: Style.textStyle26
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: heightScreen*0.02,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.1),
                      child: Text(
                          textAlign: TextAlign.center,
                          "Please enter code ",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kDescriptionText)),
                    ),
                    SizedBox(
                      height: heightScreen*0.045,
                    ),
                    CustomBuildPinCodeField(),
                    SizedBox(
                      height: heightScreen*0.1,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.05),
                      child: CustomButton(onPressed: (){}, text: "Check"),
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
