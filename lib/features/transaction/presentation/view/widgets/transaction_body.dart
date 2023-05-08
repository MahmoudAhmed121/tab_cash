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

class TransactionBody extends StatelessWidget {
   TransactionBody({Key? key}) : super(key: key);

  final SendCode sendCode = SendCode();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: widthScreen*0.05).copyWith(top:heightScreen*0.06 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Transactions",style : GoogleFonts.josefinSans(textStyle: Style.textStyle24,color: kContainerColor),),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Contacts",style : GoogleFonts.prompt(textStyle: Style.textStyle20,color: kPinActiveBorder,fontWeight: FontWeight.w400),),
                  Icon(Icons.add_box_outlined ,color: kbackgroundbottomBar,size: 30, ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left:widthScreen*0.03,bottom: heightScreen*0.04),
                child: Text(
                  "Recent",
                  style : GoogleFonts.prompt(textStyle: Style.textStyle14,color: kPinInActiveBorder,fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                  child: CustomAnimationContact()
              ,),
              SizedBox(
                height: 30,
              ),
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding:EdgeInsets.only( bottom: heightScreen*0.01, top: heightScreen*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All Contact",style : GoogleFonts.prompt(textStyle: Style.textStyle16,color: kPinInActiveBorder,fontWeight: FontWeight.w400),),
                      Text("See All",style : GoogleFonts.prompt(textStyle: Style.textStyle14,color: kPinActiveBorder,fontWeight: FontWeight.w400),),
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



class CustomListView extends StatelessWidget {
  CustomListView({super.key});
  final List<TransactionModel>  userContact = [
  TransactionModel(image: "assets/images/1.png",name: "nada"),
  TransactionModel(image: "assets/images/2.png",name: "Nouran"),
  TransactionModel(image: "assets/images/3.png",name: "Lila"),
  TransactionModel(image: "assets/images/4.png",name: "Emain"),
  TransactionModel(image: "assets/images/5.png",name: "Yara"),
  TransactionModel(image: "assets/images/6.png",name: "Tasneem"),
];
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: userContact.length,
        itemBuilder: (context, index) {
          return FadeInRight(
            duration: Duration(milliseconds: (index * 100) + 500),
            child: Container(
              height: heightScreen*0.11,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.only(left: widthScreen*0.06),
              decoration: BoxDecoration(
                color: ktextWoletColor,
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Row(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red[100],
                          backgroundImage: AssetImage(userContact[index].image),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${userContact[index].name}",
                        style:  GoogleFonts.josefinSans(textStyle: Style.textStyle16,color: kContainerColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: kContainerColor,
                      size: 15,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
