import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_cach/features/login/data/model/loginModel.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController phoneEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  Future<void> postData(
      {required String email, required String password}) async {
    try {
      emit(LoginLoading());
      final response = await Dio().post(
        "https://tabcash-backend.nourmohamed.com/accounts/api/token/",
        data: {
          "phone_number": email,
          "password": password,
        },
      );
      final data = LoginModel.fromJson(response.data);
      emit(LoginSuccess(loginModel: data));
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        print("my error is ${e.response!.statusCode}");
        emit(LoginFailure("This number is not registered"));
      }
    }
  }
}
