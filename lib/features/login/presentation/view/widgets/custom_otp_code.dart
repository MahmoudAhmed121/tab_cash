import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/features/regis/presentation/view/widgets/custom_send_code_body.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../bottom_bar/presentation/view/bottom_nav_bar.dart';
import '../../../../regis/presentation/manager/phone_auth/phone_auth_cubit.dart';
import 'custom_build_pin_code_field.dart';
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
      appBar: CustomAppBar(context),
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
                      child: CustomButton(
                        onPressed: (){
                          /*showProgressIndicator(context);
                          _login(context);*/
                          Get.to(BottomNavBarView());
                      }, text: "Check"),
                    ),
                    _buildPhoneVerificationBloc(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   late String otpCode ;


   void _login (BuildContext context){
     BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
   }

   void showProgressIndicator (BuildContext context){
     AlertDialog alertDialog = AlertDialog(
       backgroundColor: Colors.transparent,
       elevation: 0,
       content: Center(
         child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
       ),
     );

     showDialog(
         barrierColor: Colors.white.withOpacity(0),
         barrierDismissible: false,
         context: context,
         builder: (context) => alertDialog);
   }

   Widget _buildPhoneVerificationBloc (){
     return BlocListener<PhoneAuthCubit,PhoneAuthState>(
       listenWhen: (previous , current){
         return previous != current ;
       },

       listener: (context ,state){
         if(state is Loading){ showProgressIndicator (context);  }

         if(state is PhoneOTPVerified){
           Navigator.pop(context);
           Get.to(BottomNavBarView());
         }

         if(state is ErrorOccurred){
           String errorMsg = (state).errorMsg;
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text(errorMsg),backgroundColor: Colors.black,duration: Duration(seconds: 3),));
         }
       },

       child: Container(),
     );
   }
}
