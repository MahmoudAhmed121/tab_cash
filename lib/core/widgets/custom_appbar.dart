 import 'package:flutter/material.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';

AppBar CustomAppBar(context,{String? title , TextStyle? textStyle}) {
  double heightScreen = MediaQuery.of(context).size.height;
  double widthScreen = MediaQuery.of(context).size.width;
    return AppBar(
      toolbarHeight: heightScreen*0.12,
      leadingWidth: widthScreen,
      leading: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: widthScreen*0.06,right: widthScreen*0.08),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtomBack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:  SizedBox(
                   height:heightScreen * 0.058 ,
                  width:widthScreen * 0.08,
                  child: Icon(Icons.arrow_back_ios_rounded,),
              ),
            ),
          ),
          (title != null )?Text("$title",style:textStyle,):SizedBox(),
        ],
      ),
      backgroundColor: kBackGroundColor,
      elevation: 0,

    );
  }