import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/features/bottom_bar/presentation/view/bottom_nav_bar.dart';
import 'package:tab_cach/features/login/presentation/manager/phone_auth/phone_auth_cubit.dart';
import 'package:tab_cach/features/login/presentation/view/widgets/custom_show_progress_indicator.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'custom_buttom.dart';

class CustomOtpCode extends StatefulWidget {
  const CustomOtpCode({Key? key}) : super(key: key);

  @override
  State<CustomOtpCode> createState() => _CustomOtpCodeState();
}

class _CustomOtpCodeState extends State<CustomOtpCode> {
  late String otpCode;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          customShowProgressIndicator(context);
        }

        if (state is PhoneAuthError) {
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorMsg),
            backgroundColor: Colors.white,
            duration: Duration(seconds: 3),
          ));
        }

        if (state is PhoneOTPVerified) {
          Get.to(BottomNavBarView());
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(context),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthScreen * 0.08,
                    vertical: heightScreen * 0.1),
                child: Container(
                  height: heightScreen * 0.58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: kContainerColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        "Enter Code",
                        style: Style.textStyle26
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: heightScreen * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthScreen * 0.1),
                        child: Text(
                            textAlign: TextAlign.center,
                            "Please enter code ",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kDescriptionText)),
                      ),
                      SizedBox(
                        height: heightScreen * 0.045,
                      ),
                      Container(
                        width: 260,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 6,
                          autoFocus: true,
                          obscureText: false,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.scale,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 38,
                            fieldWidth: 33,
                            borderWidth: 2,
                            activeColor: kPinActiveBorder,
                            inactiveColor: kPinInActiveBorder,
                            activeFillColor: kContainerColor,
                            inactiveFillColor: kContainerColor,
                            selectedColor: kPinActiveBorder,
                            selectedFillColor: kContainerColor,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: kContainerColor,
                          enableActiveFill: true,
                          onCompleted: (submittedCode) {
                            otpCode = submittedCode;
                          },
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: heightScreen * 0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widthScreen * 0.05),
                        child: CustomButton(
                            onPressed: () {
                              PhoneAuthCubit.get(context).codeSubmit(otpCode);
                            },
                            text: "Check"),
                      ),
                      // _buildPhoneVerificationBloc(),
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

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        context: context,
        builder: (context) => alertDialog);
  }
}
