import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'regis_state.dart';

class RegisCubit extends Cubit<RegisState> {
  RegisCubit() : super(RegisInitial());

  static RegisCubit get(context) => BlocProvider.of(context);
  Future<void> sendData({
    required String fullName,
    required String phoneNumer,
    required String password,
  }) async {
    emit(RegisLoading());
    try {
      final response = await Dio().post(
        "https://tabcash-backend.nourmohamed.com/accounts/api/signup/",
        data: {
          "full_name": fullName,
          "phone_number": phoneNumer,
          "password": password,
        },
      );
      emit(RegisSuccess());
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        emit(RegisFailure(errorMessage: e.response!.data["phone_number"][0]));
      }
    }
    ;
  }
}
