import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/app_localizations.dart';
import 'package:tab_cach/core/utils/assets.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/core/widgets/bar_menu_widgets.dart';
import 'package:tab_cach/features/home/data/repo/home_repo_impl.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/bar_chart_widgets.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/custom_Appbar_home.dart';
import 'package:tab_cach/features/home/presentation/view/widgets/custom_income_expense_widget.dart';
import 'package:tab_cach/features/login/presentation/view/login_view.dart';
import '../../../../../core/utils/cubit/locale_cubit.dart';
import '../../../../../core/utils/shared/cache_helber.dart';
import '../../manager/balance/balance_cubit.dart';
import '../../manager/statistics/statistics_cubit.dart';
import 'custom_board_money.dart';
import 'custom_income_expense_chart.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final String dropdownButton = "Month";
  final BalanceCubit balanceCubit = BalanceCubit(HomeRepoImpl());
  @override
  void initState() {
    super.initState();

    context.read<BalanceCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return BlocConsumer<BalanceCubit, BalanceState>(listener: (context, state) {
      if (state is BalanceSuccess) {}
      if (state is BalanceFailure) {
        CacheHelber.removeData(key: "phoneNumber");
        Get.to(LoginView());
      }
     
    }, builder: (context, state) {
      if (state is BalanceSuccess) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightScreen * 0.07,
                  ),
                  CustomAppbarHome(
                    image: Images.person4,
                    title: "Hi Mohamed",
                    icon1: Icon(Icons.notifications_none),
                    icon2: barMenu(context),
                    onPressedIconOne: () {},
                  ),
                  SizedBox(
                    height: heightScreen * 0.05,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
                    child: InkWell(
                      onTap: () {},
                      child:
                          CustomBoardMoney(balance: state.balanceModel.balance),
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * 0.06,
                  ),
                  Text(
                    "Statistics".translat(context),
                    style: GoogleFonts.josefinSans(
                      textStyle: Style.textStyle26,
                      color: kbackgroundbottomBar,
                    ),
                  ),
                  BlocConsumer<StatisticsCubit, StatisticsState>(
                    listener: (context, state) {
                      if (state is StatisticsFailure) {
                        CacheHelber.removeData(key: "token");

                        Get.to(LoginView());
                      }
                    },
                    builder: (context, state) {
                      if (state is StatisticsSuccess) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: widthScreen * 0.04),
                          child: SizedBox(
                            height: heightScreen * 0.25,
                            child: BarChartSample2(),
                          ),
                        );
                      }
                      if (state is StatisticsFailure) {
                        print(state.erorrMessage);
                      }
                      return Center(
                        child: SizedBox(
                          height: heightScreen * 0.02,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: heightScreen * 0.005,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widthScreen * 0.17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomIncomeExpenseChart(
                          color: kButtomBack,
                          title: "Income".translat(context),
                        ),
                        SizedBox(
                          width: widthScreen * 0.075,
                        ),
                        CustomIncomeExpenseChart(
                          color: kExpenseColor,
                          title: "Expense".translat(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * 0.03,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<LocaleCubit, ChangeLocaleState>(
                          builder: (context, state) {
                            return DropdownButton(
                                value: state.locale.languageCode,
                                items: ["ar", "en"].map((String items) {
                                  return DropdownMenuItem<String>(
                                    child: Text("iteam"),
                                    value: items,
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    context
                                        .read<LocaleCubit>()
                                        .changeLanguage(newValue);
                                  }
                                });
                          },
                        ),
                        CustomIncomeExpense(
                          name: "Expense".translat(context),
                          money: "\$97.45",
                        ),
                      ],
                    ),
                  ),

                  // BottomNavBarView(),
                ],
              ),
            ),
          ),
        );
      }
      return SizedBox(
        width: widthScreen,
        child: Container(
          color: kBackGroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        ),
      );
    });
  }
}
