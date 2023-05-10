import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/login/presentation/view/login_view.dart';
import 'package:tab_cach/features/transaction/presentation/manager/transaction/transaction_cubit.dart';
import 'package:tab_cach/features/transaction/presentation/view/widgets/custom_receipt.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'custom_text_money_field.dart';

class CustomSendMoneyContact extends StatelessWidget {
  CustomSendMoneyContact(
      {Key? key, required this.image, required this.name, required this.phone})
      : super(key: key);
  final String image;
  final String? name;
  final String phone;
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccess) {
          Get.to(CustomReceipt());
        }
        if (state is TransactionFailure) {
          CacheHelber.removeData(key: "token");
          Get.to(LoginView());
        }
        if (state is TransactionExiption) {
          Get.snackbar(
            "Message",
            "",
            backgroundColor: Colors.grey,
            messageText: Text(
              "${state.exption}",
              style: TextStyle(color: Colors.white),
            ),
          );
        }if (state is TransactionNotFound) {
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
          appBar: CustomAppBar(
            context,
            title: "Send Money",
            textStyle: GoogleFonts.josefinSans(
                textStyle: Style.textStyle26, color: kContainerColor),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.09)
                  .copyWith(top: heightScreen * 0.07),
              child: Center(
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Text(
                    "Send Money",
                    style: GoogleFonts.josefinSans( textStyle: Style.textStyle26, color: kContainerColor),
                  ),*/
                      //SizedBox(height: heightScreen * 0.1,),
                      SizedBox(
                        height: heightScreen * 0.18,
                        width: widthScreen * 0.4,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(image),
                        ),
                      ),

                      SizedBox(
                        height: heightScreen * 0.05,
                      ),
                      Text(
                        "Send Money",
                        style: GoogleFonts.prompt(
                            textStyle: Style.textStyle16,
                            color: kPinInActiveBorder),
                      ),
                      SizedBox(
                        height: heightScreen * 0.01,
                      ),
                      Text(
                        "${name}",
                        style: GoogleFonts.prompt(
                            textStyle: Style.textStyle26,
                            color: kContainerColor),
                      ),
                      SizedBox(
                        height: heightScreen * 0.08,
                      ),
                      // CustomTextMoneyField(
                      //     textEditingController: phoneEditingController,
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return "You cloud inter a money";
                      //       }
                      //       return null;
                      //     }),

                      CustomTextMoneyField(
                          textEditingController: textEditingController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "You cloud inter a money";
                            }
                            return null;
                          }),

                      SizedBox(
                        height: heightScreen * 0.1,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: ConditionalBuilder(
                          condition: state is! TransactionLoading,
                          builder: (context) {
                            return ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  BlocProvider.of<TransactionCubit>(context)
                                      .sendMoney(
                                          user: phone,
                                          money: phoneEditingController.text
                                          );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPinInActiveField,
                                fixedSize: Size(
                                    widthScreen * 0.37, heightScreen * 0.08),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'Send',
                                style: Style.textStyle20
                                    .copyWith(color: kBackGroundColor),
                              ),
                            );
                          },
                          fallback: (context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
