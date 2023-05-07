
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

static LoginCubit get(context)=> BlocProvider.of(context);
  Future<void> postData({required String  email,required  String password}) async {
    try {
      emit(LoginLoading());
      final response = await Dio(BaseOptions(
        
      )).post(
        "https://tabcash-backend.nourmohamed.com/accounts/api/token/",
        data: {
          "phone_number": email,
          "password": password,
        },
      );
      emit(LoginSuccess());
    } on DioError catch (e) {
      print(e);
      if (e.response!.statusCode == 401) {
        emit(LoginFailure("This number is not registered"));
      }
    }
  }
}
