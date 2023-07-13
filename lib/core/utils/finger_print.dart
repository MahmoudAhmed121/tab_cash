import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/onbarding/presentation/view/onboardingView.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import '../../features/bottom_bar/presentation/view/bottom_nav_bar.dart';
import '../../features/login/presentation/view/login_view.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class FingerPrint {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> authAuth(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      bool authenticate = await _localAuthentication.authenticate(
        localizedReason: "Please authenticate to continue",
        authMessages: [
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
            
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ]);
        AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
          
        );
      
      final skip = await CacheHelber.getData(key: "skip");
      final token = await CacheHelber.getData(key: "token");

      if (token != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBarView()));
        //Get.to(BottomNavBarView());
      } else if (skip == null) {
        Get.to(OnboardingView());
      } else {
        Get.to(LoginView());
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        cancelApp();
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        cancelApp();
      } else {
       cancelApp();
      }
    }
  }

  void cancelApp() {
    exit(0);
  }
}
