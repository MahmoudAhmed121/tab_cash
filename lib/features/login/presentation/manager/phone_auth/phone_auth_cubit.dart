import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());
  late String verificationId;
  static PhoneAuthCubit get(context) => BlocProvider.of(context);

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print("verificationCompleted");
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException exception) async {
    print("verificationFailed");
    print("my error is ${exception.toString()}");
    emit(PhoneAuthError(errorMsg: exception.toString()));
  }

  void codeSent(String verificationId, int? resindToken) {
    print("codeSent");
    print("my resindToken is $resindToken");
    this.verificationId = verificationId;
    
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print("codeAutoRetrievalTimeout");
  }

  Future<void> codeSubmit(String otp) async {
    print(otp);
    print("codeSubmit");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: this.verificationId, smsCode: otp);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerified());
    } catch (e) {
      print("my signIn error is ${e.toString()}" );
      emit(PhoneAuthError(errorMsg: e.toString()));
    }
  }
}
