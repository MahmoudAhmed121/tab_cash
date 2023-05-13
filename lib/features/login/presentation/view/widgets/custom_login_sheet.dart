import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/bottom_bar/presentation/view/bottom_nav_bar.dart';
import 'package:tab_cach/core/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/login/presentation/manager/login/login_cubit_cubit.dart';
import 'package:tab_cach/features/login/presentation/view/widgets/custom_buttom.dart';
import 'package:tab_cach/features/regis/presentation/view/regis_view.dart';
import '../../../../../core/utils/shared/cache_helber.dart';
import 'custom_forgot_password.dart';

class CustomLoginModelSheet extends StatefulWidget {
  CustomLoginModelSheet({
    required this.text,
  });

  final String text;

  @override
  State<CustomLoginModelSheet> createState() => _CustomLoginModelSheetState();
}

class _CustomLoginModelSheetState extends State<CustomLoginModelSheet> {
  final GlobalKey<FormState> key = GlobalKey();

  final TextEditingController phoneEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            final token = CacheHelber.saveData(
                    key: "token", value: state.loginModel.access)
                .then((value) {
              if (value) {
                Get.snackbar(
                  "Message",
                  "",
                  backgroundColor: Colors.grey,
                  messageText: Text(
                    "Login Success",
                    style: TextStyle(color: Colors.white),
                  ),
                );
                Get.to(BottomNavBarView());
              }
            });
          }
          if (state is LoginFailure) {
            Get.snackbar(
              "Message",
              "",
              backgroundColor: Colors.grey,
              messageText: Text(
                "${state.errorMessage}",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
        builder: (context, state) {
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
                            // return null;
                          },
                          onSaved: (value) {
                            return null;
                          },
                          textEditingController: phoneEditingController),
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
                        textEditingController: passwordEditingController,
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
                    ConditionalBuilder(
                      condition: state is! LoginLoading,
                      builder: (context) {
                        return CustomButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              LoginCubit.get(context).postData(
                                email: phoneEditingController.text,
                                password: passwordEditingController.text,
                              );
                            }
                          },
                          text: "Login",
                        );
                      },
                      fallback: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
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
        },
      ),
    );
  }
}
