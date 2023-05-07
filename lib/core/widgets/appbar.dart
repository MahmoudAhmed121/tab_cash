 import 'package:flutter/material.dart';
import 'package:tab_cach/constant.dart';

AppBar appBar(context) {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 85,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 30,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded),
          style: ElevatedButton.styleFrom(
            backgroundColor: kButtomBack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      backgroundColor: kBackGroundColor,
      elevation: 0,
    );
  }