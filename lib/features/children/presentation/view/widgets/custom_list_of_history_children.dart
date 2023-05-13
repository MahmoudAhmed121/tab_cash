import 'package:flutter/material.dart';
import 'package:tab_cach/features/children/presentation/view/widgets/custom_list_history_for_children.dart';






class CustomListOfHistoryChildren extends StatelessWidget {
  const CustomListOfHistoryChildren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;


    return Container(
      height: heightScreen*0.8,
      width: widthScreen,
      padding: EdgeInsets.symmetric(horizontal: widthScreen*0.05).copyWith(top: heightScreen*0.04),
      child:  CustomListOfChildrenHistory(),
    );
  }
}
