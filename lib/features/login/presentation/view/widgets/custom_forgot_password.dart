import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/core/widgets/custom_appbar.dart';
import 'package:tab_cach/core/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/login/presentation/view/widgets/custom_buttom.dart';


import 'package:tab_cach/features/regis/presentation/view/widgets/custom_send_code_body.dart';

class CustomForGotPassword extends StatelessWidget {
  CustomForGotPassword({super.key});
  final SendCode sendCode = SendCode();
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: CustomAppBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.08,vertical: heightScreen*0.1),
              child: Container(
                height: heightScreen*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: kContainerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: Style.textStyle26
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: heightScreen*0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: Text(
                          textAlign: TextAlign.center,
                          "if you forget your password don’t worry just enter your email and will send to you a code to recover it ",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kDescriptionText)),
                    ),
                    SizedBox(
                      height: heightScreen*0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: SizedBox(
                        height: heightScreen*0.09,
                        child: CustomTextFormFaild(
                          hintText: "Phone Number",
                          obscureText: false,
                          validator: (text) {
                            return null;
                          

                          },
                          onSaved: (value){
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightScreen*0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child:  CustomButton(
                        onPressed: () {
                        },
                        text: "Recover",
                      ),
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