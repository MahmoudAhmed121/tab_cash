import 'package:local_auth/local_auth.dart';

class FingerPrint {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> isFingerPrintEnaple() async {
    final fingerPrintEnaple = await _localAuthentication.canCheckBiometrics;

    return fingerPrintEnaple;
  }

  Future<bool> isAuth(String message) async {
    final auth = await _localAuthentication.authenticate(
        localizedReason: message,
        options: AuthenticationOptions(
          biometricOnly: true,
        ));
    return auth;
  }
}
