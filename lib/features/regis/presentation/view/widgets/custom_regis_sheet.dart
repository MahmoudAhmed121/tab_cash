import 'package:flutter/material.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/login/view/widgets/custom_buttom.dart';
import 'package:tab_cach/features/login/view/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/regis/presentation/view/widgets/custom_send_code_body.dart';

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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 8,
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
              height: 14,
            ),
            Text(
              text,
              style: Style.textStyle30.copyWith(color: kSiginColor),
            ),
            SizedBox(
              height: 36,
            ),
            CustomTextFormFaild(
              hintText: "Name",
              obscureText: false,
              validator: (TextOne) {
                return null;
              },
              textEditingController: phoneEditingController,
            ),
            SizedBox(
              height: 12,
            ),
            CustomTextFormFaild(
              hintText: "Phone Number",
              obscureText: false,
              validator: (TextOne) {
                return null;
              },
              textEditingController: phoneEditingController,
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: 12,
            ),
            CustomTextFormFaild(
              hintText: "Password",
              obscureText: false,
              validator: (TextTwo) {
                return null;
              },
              suffixIcon: Icon(
                Icons.visibility_off,
                color: kDescriptionText,
              ),
              textEditingController: passwordEditingController,
            ),
            SizedBox(
              height: 108,
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SendCode();
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
