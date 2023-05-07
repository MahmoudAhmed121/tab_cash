import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tab_cach/core/utils/assets.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/login/presentation/view/login_view.dart';
import 'package:tab_cach/features/onbarding/presentation/view/onboardingView.dart';

class SplachBody extends StatefulWidget {
  const SplachBody({super.key});

  @override
  State<SplachBody> createState() => _SplachBodyState();
}

class _SplachBodyState extends State<SplachBody> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () async {
        final skip = await CacheHelber.getData(key: "skip");
        if (skip != null) {
          Get.to(LoginView());
        } else {
          Get.to(OnboardingView());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.logo),
          ],
        ),
      ),
    );
  }
}
