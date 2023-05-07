import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/finger_print.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/bottom_bar/presentation/view/bottom_nav_bar.dart';
import 'package:tab_cach/features/login/view/widgets/custom_buttom.dart';
import 'package:tab_cach/features/login/view/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/regis/presentation/view/regis_view.dart';

import 'custom_forgot_password.dart';

class CustomLoginModelSheet extends StatefulWidget {
  CustomLoginModelSheet({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<CustomLoginModelSheet> createState() => _CustomLoginModelSheetState();
}

class _CustomLoginModelSheetState extends State<CustomLoginModelSheet> {
  final TextEditingController phoneEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();
  final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 0),
      () {
        FingerPrint().authAuth();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.09),
        child: Form(
          key: key,
          child: Column(
            children: [
              SizedBox(
                height: heightScreen * 0.009,
              ),
              Container(
                width: widthScreen * 0.188,
                height: heightScreen * 0.0054,
                decoration: BoxDecoration(
                  color: kDividerColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                height: heightScreen * .03,
              ),
              Text(
                widget.text,
                style: Style.textStyle30.copyWith(color: kSiginColor),
              ),
              SizedBox(
                height: heightScreen * 0.06,
              ),
              SizedBox(
                height: heightScreen * 0.09,
                child: CustomTextFormFaild(
                  hintText: "Phone Number",
                  textInputType: TextInputType.phone,
                  obscureText: false,
                  validator: (textOne) {
                    if (textOne!.isEmpty || textOne.length < 11)
                      return "You should inter a valid Phone Number";
                    return null;
                  },
                  onSaved: (value) {
                    return null;
                  },
                  textEditingController: passwordEditingController,
                ),
              ),
              SizedBox(
                height: heightScreen * 0.02,
              ),
              SizedBox(
                height: heightScreen * 0.09,
                child: CustomTextFormFaild(
                  hintText: "Password",
                  obscureText: true,
                  validator: (textTwo) {
                    if (textTwo!.isEmpty || textTwo.length < 11) {
                      return "You should inter a valid password ";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    return null;
                  },
                  textEditingController: phoneEditingController,
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: kSiginColor,
                  ),
                 
                ),
              ),
              SizedBox(
                height: heightScreen * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(CustomForGotPassword());
                    },
                    child: Text("Forget password?",
                        style: GoogleFonts.josefinSans(
                            color: kDescriptionText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              SizedBox(
                height: heightScreen * 0.09,
              ),
              CustomButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    Get.to(BottomNavBarView());
                  }
                },
                text: "Login",
              ),
              SizedBox(
                height: heightScreen * 0.02,
              ),
              InkWell(
                onTap: () {
                  Get.to(RegisView());
                },
                child: Text(
                  "Don’t have account ?",
                  style: Style.textStyle16.copyWith(
                      color: kSiginColor, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
