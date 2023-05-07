import 'package:flutter/material.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/core/widgets/app_bar_for_home.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/bar_chart_widgets.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/custom_money_container.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final String dropdownButton = "Month";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarforHome(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              CustomMoneyContainer(),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Overview",
                    style: Style.textStyle30.copyWith(
                        fontWeight: FontWeight.w500, color: kContainerColor),
                  ),
                  Container(
                    height: 35,
                    width: 83,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kContainerColor),
                    child:

                        // DropdownButton(
                        //   value: dropdownButton,
                        //   icon: Icon(Icons.arrow_drop_down_rounded),
                        //   items: [
                        //     DropdownMenuItem(
                        //       child: Text("profile"),
                        //     ),
                        //     DropdownMenuItem(
                        //       child: Text("history"),
                        //     ),
                        //     DropdownMenuItem(
                        //       child: Text(""),
                        //     ),
                        //     DropdownMenuItem(
                        //       child: Text(""),
                        //     ),
                        //     DropdownMenuItem(
                        //       child: Text("settings"),
                        //     )
                        //   ],
                        //   onChanged: (value) {},
                        //   onTap: () {},
                        // )
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Month",
                          style: Style.textStyle10,
                        ),
                        SizedBox(
                          width: 5
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: kDotColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 260, child: BarChartSample2()),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: kButtomBack,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Income"),
                  SizedBox(
                    width: 32,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: kExpenseColor,
                    ),
                  ),
                   SizedBox(
                    width: 8,
                  ),
                  Text("Expense"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
