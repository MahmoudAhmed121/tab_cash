import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:tab_cach/core/utils/app_localizations.dart';
import 'package:tab_cach/core/utils/style.dart';

import '../../../../../constant.dart';

class CustomBoardMoney extends StatelessWidget {
  const CustomBoardMoney({Key? key, required this.balance}) : super(key: key);
  final double balance ;
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return  Container(
      height:heightScreen *0.22,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kContainerColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(color: kPinActiveBorder,offset: Offset(0,1),blurRadius:35 ),
        ],
      ),
      padding: EdgeInsets.only(left: widthScreen*0.06,top: heightScreen*0.015,bottom: heightScreen*0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Balance".translat(context) , style: Style.textStyle16.copyWith(color: kPinActiveBorder),),
          Text("$balance",style:Style.textStyle30.copyWith(color: ktextWoletColor),),
          Text("010 1000 1000",style: Style.textStyle24.copyWith(color: kPinInActiveBorder,),),
        ],
      ),

    );
  }
}