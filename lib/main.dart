
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/features/children/presentation/manager/children_list/children_list_cubit.dart';
import 'package:tab_cach/features/history/data/repo/history_repo_impl.dart';
import 'package:tab_cach/features/history/presentation/manager/cubit/history_cubit.dart';
import 'package:tab_cach/features/home/data/repo/home_repo_impl.dart';
import 'package:tab_cach/features/home/presentation/manager/add_money/add_money_cubit.dart';
import 'package:tab_cach/features/login/presentation/manager/phone_auth/phone_auth_cubit.dart';
import 'package:tab_cach/features/splach/presentation/view/splach_view.dart';
import 'package:tab_cach/features/transaction/presentation/manager/transaction/transfer_cubit.dart';
import 'core/utils/app_localizations.dart';
import 'core/utils/cubit/locale_cubit.dart';
import 'features/children/data/repo/children_repo_impl.dart';
import 'features/children/presentation/manager/children_list_history.dart/children_list_history_cubit.dart';
import 'features/home/presentation/manager/balance/balance_cubit.dart';
import 'features/home/presentation/manager/statistics/statistics_cubit.dart';
import 'features/onbarding/presentation/view/manager/onboarding_boc/page_view_indicator_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( TabCach());
  DisabledCapture();
}

DisabledCapture() async {
  FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

class TabCach extends StatelessWidget {
  const TabCach({super.key,});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => PhoneAuthCubit(),),
        BlocProvider(
          create: (context) => PageViewIndicatorBloc(),
        ),
        BlocProvider(
          create: (context) => StatisticsCubit(HomeRepoImpl())..getStatis(),
        ),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(
          create: (context) => HistoryCubit(HisterRepoImpl()),
        ),
        BlocProvider(
          create: (context) => BalanceCubit(HomeRepoImpl()),
        ),
        BlocProvider(
          create: (context) => AddMoneyCubit(),
        ),
        BlocProvider(
          create: (context) => ChildrenListCubit(ChildrenRepoImpl()),
        ),
        BlocProvider(
          create: (context) => ChildrenListHistoryCubit(ChildrenRepoImpl()),
        ),
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return GetMaterialApp(
            locale: state.locale,
            supportedLocales: [Locale("en"), Locale("ar")],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: kBackGroundColor,
                textTheme: GoogleFonts.promptTextTheme()),
            home: SplachView(),
          );
        },
      ),
    );
  }
}
