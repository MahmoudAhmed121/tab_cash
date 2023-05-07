import 'package:flutter/material.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/login/view/widgets/custom_buttom.dart';
import 'package:tab_cach/features/login/view/widgets/custom_otp_code.dart';
import 'package:tab_cach/features/login/view/widgets/custom_text_form_faild.dart';



class CustomRegisSheet extends StatelessWidget {
  CustomRegisSheet({
    super.key,
    required this.text,
  });

  final String text;
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.08),
        child: Column(
          children: [
            SizedBox(
              height: heightScreen*0.01,
            ),
            Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: kDescriptionText,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              height: heightScreen*0.01,
            ),
            Text(
              text,
              style: Style.textStyle30.copyWith(color: kSiginColor),
            ),
            SizedBox(
              height: heightScreen*0.03,
            ),
            SizedBox(
              height: heightScreen*0.09,
              child: CustomTextFormFaild(
                hintText: "Name",
                obscureText: false,
                validator: (TextOne) {
                  return null;
                },
                onSaved: (value){
                  return null;
                },
                textEditingController: phoneEditingController,
              ),
            ),
            SizedBox(
              height: heightScreen*0.02,
            ),
            SizedBox(
              height: heightScreen*0.09,
              child: CustomTextFormFaild(
                hintText: "Phone Number",
                obscureText: false,
                validator: (TextOne) {
                  return null;
                },
                onSaved: (value){
                  return null;
                },
                textEditingController: phoneEditingController,
                textInputType: TextInputType.phone,
              ),
            ),
            SizedBox(
              height: heightScreen*0.02,
            ),
            SizedBox(
              height: heightScreen*0.09,
              child: CustomTextFormFaild(
                hintText: "Password",
                obscureText: false,
                validator: (TextTwo) {
                  return null;
                },
                onSaved: (value){
                  return null;
                },
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: kDescriptionText,
                ),
                textEditingController: passwordEditingController,
              ),
            ),
            SizedBox(
              height: heightScreen*0.12,
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                  //  return SendCode();
                    return CustomOtpCode();
                  },
                ));
              },
              text: "Sign up",
            ),
          ],
        ),
      ),
    );
  }
}
