import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';

part 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit() : super(ChildrenInitial());

  static ChildrenCubit get(context) => BlocProvider.of(context);

  Future<void> addChildren(
      {required String full_name,
      required String phone,
      required String password}) async {
    final token = await CacheHelber.getData(key: "token");

    try {
      emit(ChildrenLoading());
      final respnse = await Dio(
        BaseOptions(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      ).post(
        "https://tabcash-backend.nourmohamed.com/accounts/api/add-kid/",
        data: {
          "full_name": full_name,
          "phone_number": phone,
          "password": password,
        },
       
      );
       debugPrint(respnse.toString());
      emit(ChildrenSuccess());
    } on DioError catch (e) {
      // ServerFailure.fromResponse(e.response!.statusCode, e.response!.data);
      if (e.response!.statusCode == 400) {
        emit(
          ChildrenFailure(e.response!.data["phone_number"][0]),
        );
      }
    }
  }
}
