import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:tab_cach/constant.dart';

const double padding = 40;

FocusedMenuHolder barMenu(BuildContext context) {
  return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width - padding * 2,
      menuItems: [
        FocusedMenuItem(
            title: Row(children: [Image.asset("assets/images/profile.png"),SizedBox(width: 16,),Text('profile'),]),
           trailingIcon: Icon(Icons.arrow_forward_ios_rounded, color: kBackGroundColor,size: 14),
            backgroundColor: kButtomBack,
            onPressed: () {}),
        FocusedMenuItem(
            title: Row(children: [Image.asset("assets/images/hesitory.png"),SizedBox(width: 16,),Text('history'),]) ,
            trailingIcon: Icon(Icons.arrow_forward_ios_rounded, color: kBackGroundColor,size: 14),
            onPressed: () {}),
        FocusedMenuItem(
            title: Row(children: [Image.asset("assets/images/add mone.png"),SizedBox(width: 16,),Text('add money')]),
            trailingIcon: Icon(Icons.arrow_forward_ios_rounded, color: kBackGroundColor,size: 14),
            
            onPressed: () {}),
        FocusedMenuItem(
            title: Row(children: [Image.asset("assets/images/setting.png"),SizedBox(width: 16,),Text('settings'),]),

            trailingIcon: Icon(Icons.arrow_forward_ios_rounded , color: kBackGroundColor,size: 14,),
        
            onPressed: () {}),
      ],
      blurBackgroundColor: Colors.blueGrey[900],
      menuOffset: 20,
      openWithTap: true,
      duration: Duration(seconds: 0),
      animateMenuItems: false,
      onPressed: () {},
      child: Icon(Icons.menu));
}
