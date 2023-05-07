import 'package:flutter/material.dart';

import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';

class CustomMoneyContainer extends StatelessWidget {
  const CustomMoneyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: kBackGroundColor,
      shadowColor: kTextFormFieldBorder, // 
      borderRadius: BorderRadius.circular(5),
      elevation: 10,
      child: Container(
        height: 150,
        width: 375,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kbackgroundbottomBar
            ),
        child: Padding(
          padding: EdgeInsets.only(left: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6,
              ),
              Text(
                "Balance",
                style: Style.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                "\$ 945,423",
                style: Style.textStyle30.copyWith(
                  color: ktextWoletColor,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "012 435 768 231",
                style: Style.textStyle20,
              )
            ],
          ),
        ),
      ),
    );
  }
}