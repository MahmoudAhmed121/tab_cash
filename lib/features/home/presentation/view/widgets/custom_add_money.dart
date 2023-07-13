import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/core/utils/app_localizations.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/bottom_bar/presentation/view/bottom_nav_bar.dart';
import 'package:tab_cach/features/home/presentation/manager/add_money/add_money_cubit.dart';
import 'package:tab_cach/features/login/presentation/view/login_view.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'custom_add_money_text_fields.dart';

class CustomAddMoneyBody extends StatelessWidget {
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController Expiration = TextEditingController();
  final TextEditingController cvc = TextEditingController();
  final TextEditingController amount = TextEditingController();

 final GlobalKey<FormState> _key = GlobalKey();
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    return BlocConsumer<AddMoneyCubit, AddMoneyState>(
      listener: (context, state) {
        if (state is AddMoneySuccess) {
          Get.to(BottomNavBarView());
        }
        if (state is AddMoneyFailure) {
          Get.snackbar(
            "Message",
            "",
            backgroundColor: Colors.grey,
            messageText: Text(
              "${state.errorMessage}",
              style: TextStyle(color: Colors.white),
            ),
          );
          CacheHelber.removeData(key: "token");
          Get.to(LoginView());
        }
         if(state is AddMoneyExption ){
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
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            context,
            title: "Add Money".translat(context),
            textStyle: GoogleFonts.josefinSans(
                textStyle: Style.textStyle26, color: kContainerColor),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.07),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightScreen * 0.08,
                  ),
                  CustomAddMoneyTextFields(
                    textEditingController: cardNumber,
                    validator: (textOne) {
                      return null;
                    },
                    title: "Card Number".tr,
                    hintText: "1234 1234 1234 1234",
                    heightField: heightScreen * 0.07,
                    widthField: widthScreen * 0.8,
                  ),
                  SizedBox(
                    height: heightScreen * 0.06,
                  ),
                  Row(
                    children: [
                      CustomAddMoneyTextFields(
                        textEditingController: Expiration,
                        validator: (textTwo) {
                          return null;
                        },
                        title: "EXPIRATION".translat(context),
                        hintText: "MM/YY",
                        heightField: heightScreen * 0.07,
                        widthField: widthScreen * 0.5,
                      ),
                      SizedBox(
                        width: widthScreen * 0.06,
                      ),
                      CustomAddMoneyTextFields(
                        textEditingController: cvc,
                        validator: (textThere) {
                          return null;
                        },
                        title: "CVC",
                        hintText: "CVC",
                        heightField: heightScreen * 0.07,
                        widthField: widthScreen * 0.23,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightScreen * 0.075,
                  ),
                  CustomAddMoneyTextFields(
                    textEditingController: amount,
                    validator: (textFour) {
                      return null;
                    },
                    title: "Amount".translat(context),
                    hintText: "\$0",
                    heightField: heightScreen * 0.07,
                    widthField: widthScreen * 0.8,
                  ),
                  Spacer(),
                  ConditionalBuilder(
                    condition: state is! AddMoneyLoading,
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            context.read<AddMoneyCubit>().addMoney(
                                card: cardNumber.text,
                                cvv: cvc.text,
                                expiration_data: Expiration.text,
                                amount: amount.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kButtomBack,
                          fixedSize:
                              Size(widthScreen * 0.8, heightScreen * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          'Sdd Money '.translat(context),
                          style: GoogleFonts.inter(
                              textStyle: Style.textStyle20,
                              color: kContainerColor),
                        ),
                      );
                    },
                    fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * 0.07,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
