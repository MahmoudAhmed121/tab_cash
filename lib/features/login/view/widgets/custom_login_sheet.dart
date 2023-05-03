import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/login/view/widgets/custom_buttom.dart';
import 'package:tab_cach/features/login/view/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/regis/presentation/view/regis_view.dart';

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
  final LocalAuthentication auth = LocalAuthentication();

  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: key,
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
                widget.text,
                style: Style.textStyle30.copyWith(color: kSiginColor),
              ),
              SizedBox(
                height: 36,
              ),
              CustomTextFormFaild(
                hintText: "Phone Number",
                obscureText: false,
                validator: (textOne) {
                  if (textOne!.length < 11 ) {
                    return "You should inter a valid Phone Number";
                  }
                  return null;
                },
                textEditingController: phoneEditingController,
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: kDescriptionText,
                ),
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
                textEditingController: passwordEditingController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormFaild(
                hintText: "Confirm Password",
                obscureText: false,
                validator: (TextTwo) {
                  return null;
                },
                textEditingController: passwordEditingController,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text("Forget password?",
                        style: GoogleFonts.josefinSans(
                            color: kDescriptionText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              SizedBox(
                height: 72,
              ),
              CustomButton(
                onPressed: () {
                  if (key.currentState!.validate()) {}
                },
                text: "Login",
              ),
              SizedBox(
                height: 16,
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

  Future<void> _authAuth() async {
    try {
      bool authenticate = await auth.authenticate(
        localizedReason: "gamed",
        options: AuthenticationOptions(
            stickyAuth: true, biometricOnly: true, sensitiveTransaction: true),
      );
      print(authenticate);
    } on PlatformException {}
  }
}
