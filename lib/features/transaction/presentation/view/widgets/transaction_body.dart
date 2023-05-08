import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/core/utils/style.dart';

import 'package:tab_cach/features/regis/presentation/view/widgets/custom_send_code_body.dart';
import 'package:tab_cach/features/transaction/presentation/view/widgets/custom_contact_widgets.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/appbar.dart';
import '../../../../home/presentation/view/widgets/custom_Appbar_home.dart';
import '../../../data/model/transaction_model.dart';
import 'custom_listView_contacts.dart';

class TransactionBody extends StatelessWidget {
  TransactionBody({Key? key}) : super(key: key);

  final SendCode sendCode = SendCode();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.05).copyWith(top: heightScreen * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Transactions",
                style: GoogleFonts.josefinSans(
                    textStyle: Style.textStyle26, color: kContainerColor),
              ),
              SizedBox(
                height: heightScreen*0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contacts",
                    style: GoogleFonts.prompt(
                        textStyle: Style.textStyle20,
                        color: kPinActiveBorder,
                        fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.add_box_outlined,
                    color: kbackgroundbottomBar,
                    size: 28,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: widthScreen * 0.03, bottom: heightScreen * 0.04),
                child: Text(
                  "Recent",
                  style: GoogleFonts.prompt(
                      textStyle: Style.textStyle14,
                      color: kPinInActiveBorder,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                child: CustomAnimationContact(),
              ),
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: heightScreen * 0.01, top: heightScreen * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Contact",
                        style: GoogleFonts.prompt(
                            textStyle: Style.textStyle16,
                            color: kPinInActiveBorder,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "See All  ",
                        style: GoogleFonts.prompt(
                            textStyle: Style.textStyle12,
                            color: kPinActiveBorder,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              CustomListView()
            ],
          ),
        ),
      ),
    );
  }
}
