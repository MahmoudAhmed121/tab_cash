import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/bottom_bar/presentation/view/bottom_nav_bar.dart';

import '../../features/login/presentation/view/login_view.dart';
import '../../features/onbarding/presentation/view/onboardingView.dart';

class FingerPrint {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> authAuth(BuildContext context) async {
    try {
      bool authenticate = await _localAuthentication.authenticate(
        localizedReason: "Please authenticate to continue",
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      final skip = await CacheHelber.getData(key: "skip");
        if (skip != null) {
          Get.to(LoginView());
        } else {
          Get.to(OnboardingView());
        }
        final token = await CacheHelber.getData(key: "token");
        if (token != null) {
          Get.to(BottomNavBarView());
        } else {
          Get.to(LoginView());
        }
    } on PlatformException {
      Navigator.pop(context);
    }
  }
}
