import 'package:flutter/material.dart';
import 'package:tab_cach/core/utils/style.dart';

import '../../../../../constant.dart';


class CustomIncomeExpenseChart extends StatelessWidget {
   CustomIncomeExpenseChart({Key? key,required this.color,required this.title}) : super(key: key);
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return  Row(
      children: [
        Container(
          height:heightScreen * 0.01,
          width: widthScreen*0.022,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(2))
          ),
          
        ),
        Text("$title",style: Style.textStyle14.copyWith(color: kTextChartColor),),
      ],
    );
  }
}
