import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/features/login/presentation/manager/phone_auth/phone_auth_cubit.dart';
import 'features/onbarding/presentation/view/manager/onboarding_boc/page_view_indicator_bloc.dart';
import 'features/splach/presentation/view/splach_view.dart';

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

