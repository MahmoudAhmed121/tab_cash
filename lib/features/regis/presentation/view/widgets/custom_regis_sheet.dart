import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/core/widgets/custom_text_form_faild.dart';
import 'package:tab_cach/features/login/presentation/view/widgets/custom_buttom.dart';
import 'package:tab_cach/features/regis/presentation/manager/regis/regis_cubit.dart';
import 'package:tab_cach/features/regis/presentation/view/widgets/custom_send_code_body.dart';

class CustomRegisSheet extends StatefulWidget {
  CustomRegisSheet({
    required this.text,
  });

  final String text;

  @override
  State<CustomRegisSheet> createState() => _CustomRegisSheetState();
}

class _CustomRegisSheetState extends State<CustomRegisSheet> {
  final TextEditingController NameEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisCubit(),
      child: BlocConsumer<RegisCubit, RegisState>(
        listener: (context, state) {
          if (state is RegisSuccess) {
            Get.snackbar(
              "Message",
              "",
              backgroundColor: Colors.grey,
              messageText: Text(
                "Regis Success",
                style: TextStyle(color: Colors.white),
              ),
            );
            Get.to(SendCode());
          }
          if (state is RegisFailure) {
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
              padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.08),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: heightScreen * 0.01,
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
                      height: heightScreen * 0.01,
                    ),
                    Text(
                      widget.text,
                      style: Style.textStyle30.copyWith(color: kSiginColor),
                    ),
                    SizedBox(
                      height: heightScreen * 0.03,
                    ),
                    SizedBox(
                      height: heightScreen * 0.09,
                      child: CustomTextFormFaild(
                        hintText: "Full Name",
                        obscureText: false,
                        validator: (textOne) {
                          if (textOne!.isEmpty &&
                              textOne.length < 8 &&
                              !textOne.contains("@")) {
                            return "you should Inter Valid Name ";
                          }
                          return null;
                        },
                        textEditingController: NameEditingController,
                      ),
                    ),
                    SizedBox(
                      height: heightScreen * 0.02,
                    ),
                    SizedBox(
                      height: heightScreen * 0.09,
                      child: CustomTextFormFaild(
                        hintText: "Phone Number",
                        obscureText: false,
                        validator: (textTwo) {
                          return null;
                        
                        //  if (textTwo!.isEmpty) {
                        //     return "you should Inter Valid Phone Number";
                        //   }else if (textTwo.length < 11) {
                        //     return "your Password is weak";
                        //   }
                        },
                        textEditingController: phoneEditingController,
                        textInputType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(
                      height: heightScreen * 0.02,
                    ),
                    SizedBox(
                      height: heightScreen * 0.09,
                      child: CustomTextFormFaild(
                        hintText: "Password",
                        obscureText: false,
                        validator: (textThere) {
                          if (textThere!.isEmpty) {
                            return "you should Inter Valid Password ";
                          }else if (textThere.length < 11) {
                            return "your Password is weak";
                          }else if(!textThere.contains("@")){
                            return "your password should have @ or \$";
                          }
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
                      height: heightScreen * 0.12,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisLoading,
                      builder: (context) {
                        return CustomButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              RegisCubit.get(context).sendData(
                                  fullName: NameEditingController.text,
                                  phoneNumer: phoneEditingController.text,
                                  password: passwordEditingController.text);
                            }
                          },
                          text: "Sign up",
                        );
                      },
                      fallback: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
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
