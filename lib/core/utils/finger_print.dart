import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrint {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

 Future<void> authAuth() async {
    try {
      bool authenticate = await _localAuthentication.authenticate(
        localizedReason: "gamed",
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      print(authenticate);
    } on PlatformException {}
  }
}
