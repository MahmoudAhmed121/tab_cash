import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/assets.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/core/widgets/bar_menu_widgets.dart';
import 'package:tab_cach/features/home/presentation/manager/cubit/statistics_cubit.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/bar_chart_widgets.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/custom_Appbar_home.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/custom_income_expense_widget.dart';
import 'package:tab_cach/features/login/presentation/view/login_view.dart';
import '../../../../../core/utils/shared/cache_helber.dart';
import 'custom_board_money.dart';
import 'custom_income_expense_chart.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
 
  final String dropdownButton = "Month";
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: heightScreen * 0.07,
            ),
            CustomAppbarHome(
              image: Images.person,
              title: "Hi Mohamed",
              icon1: Icon(Icons.notifications_none),
              icon2: barMenu(context),
              onPressedIconOne: () {},
              onPressedIconTwo: () {
              
              },
            ),
            SizedBox(
              height: heightScreen * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
              child: CustomBoardMoney(),
            ),
            SizedBox(
              height: heightScreen * 0.06,
            ),
            Text(
              "Statistics",
              style: GoogleFonts.josefinSans(
                  textStyle: Style.textStyle26, color: kbackgroundbottomBar),
            ),

            BlocConsumer<StatisticsCubit, StatisticsState>(
                listener: (context, state) {
              if (state is StatisticsFailure) {
                CacheHelber.removeData(key: "token");
                Get.to(LoginView());
              }
            }, builder: (context, state) {
              if (state is StatisticsSuccess) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
                  child: SizedBox(
                    height: heightScreen * 0.25,
                    child: BarChartSample2(),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),

            SizedBox(
              height: heightScreen * 0.005,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIncomeExpenseChart(
                    color: kButtomBack,
                    title: " Income",
                  ),
                  SizedBox(
                    width: widthScreen * 0.075,
                  ),
                  CustomIncomeExpenseChart(
                    color: kExpenseColor,
                    title: " Expense",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightScreen * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIncomeExpense(
                    name: "Income",
                    money: "\$97.45",
                  ),
                  CustomIncomeExpense(
                    name: "Expense",
                    money: "\$97.45",
                  ),
                ],
              ),
            ),

            // BottomNavBarView(),
          ],
        ),
      ),
    );
  }

 
}