import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';

part 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit() : super(ChildrenInitial());

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
      emit(ChildrenSuccess());
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        emit(
          ChildrenFailure("This number is not registered"),
        );
      }
    }
  }
}
