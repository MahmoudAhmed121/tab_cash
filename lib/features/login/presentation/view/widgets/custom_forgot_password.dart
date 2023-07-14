import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/core/widgets/custom_appbar.dart';
import 'package:tab_cach/core/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/login/presentation/manager/phone_auth/phone_auth_cubit.dart';
import 'package:tab_cach/features/login/presentation/view/widgets/custom_buttom.dart';
import 'package:tab_cach/features/login/presentation/view/widgets/custom_otp_code.dart';

class CustomForGotPassword extends StatefulWidget {
  const CustomForGotPassword({super.key});

  @override
  State<CustomForGotPassword> createState() => _CustomForGotPasswordState();
}

class _CustomForGotPasswordState extends State<CustomForGotPassword> {
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthScreen * 0.08,
                    vertical: heightScreen * 0.1),
                child: Container(
                  height: heightScreen * 0.6,
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
                        height: heightScreen * 0.02,
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
                        height: heightScreen * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: SizedBox(
                          height: heightScreen * 0.09,
                          child: CustomTextFormFaild(
                            textEditingController: phoneNumber,
                            hintText: "Phone Number",
                            obscureText: false,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "please enter your phone number!";
                              } else if (text.length < 11) {
                                return "too short for  a phone number";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightScreen * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: CustomButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              PhoneAuthCubit.get(context)
                                  .submitPhoneNumber(this.phoneNumber.text);
                              Get.to(CustomOtpCode());
                            }
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
      ),
    );
  }
}
