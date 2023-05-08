import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> sendMoney({required String user, required String money}) async {
    final token = await CacheHelber.getData(key: "token");
    try {
      emit(TransactionLoading());
      final response = await Dio(
        BaseOptions(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      ).post(
        "https://tabcash-backend.nourmohamed.com/wallet/api/transfer/",
        data: {
          "to_wallet": user,
          "amount": money,
        },
      );

      emit(TransactionSuccess());
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        emit(TransactionFailure("This number is not registered"));
      }
    }
  }
}
