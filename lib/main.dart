import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/features/history/data/repo/history_repo_impl.dart';
import 'package:tab_cach/features/history/presentation/manager/cubit/history_cubit.dart';
import 'package:tab_cach/features/home/data/repo/home_repo_impl.dart';
import 'package:tab_cach/features/home/presentation/manager/cubit/statistics_cubit.dart';
import 'package:tab_cach/features/login/presentation/manager/phone_auth/phone_auth_cubit.dart';
import 'package:tab_cach/features/splach/presentation/view/splach_view.dart';
import 'package:tab_cach/features/transaction/presentation/manager/transaction/transaction_cubit.dart';
import 'features/onbarding/presentation/view/manager/onboarding_boc/page_view_indicator_bloc.dart';

void main() {
  runApp(const TabCach());
}

class TabCach extends StatelessWidget {
  const TabCach({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhoneAuthCubit(),
        ),
        BlocProvider(
          create: (context) => PageViewIndicatorBloc(),
        ),
        BlocProvider(
          create: (context) => StatisticsCubit(HomeRepoImpl())..getStatis(),
        ),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => HistoryCubit(HisterRepoImpl())..data(),)
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kBackGroundColor,
            textTheme: GoogleFonts.promptTextTheme()),
        home: SplachView(),
      ),
    );
  }
}
