import 'package:flutter/material.dart';


import '../../../../../constant.dart';

AppBar appBar(context) {
    return AppBar(
      toolbarHeight: 100,
      leadingWidth: 80,
      leading: Padding(
        padding:  EdgeInsets.only(
          
          left: 30,
          bottom: 10
        ),
        child: Row(
          children: [
            PhysicalModel(
          color: kBackGroundColor,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(5),
          elevation: 10.0,
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
      
          ],
        )),
      backgroundColor: kBackGroundColor,
      elevation: 0,
    );
  }

