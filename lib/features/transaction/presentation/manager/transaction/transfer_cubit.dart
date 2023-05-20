import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import '../../../data/model/transactionSuccess.dart';
part 'transfer_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  static TransactionCubit get(context) => BlocProvider.of(context);

  Future<void> sendMoney({required String user, required String money}) async {
    
    final token = await CacheHelber.getData(key: "token");
    try {
      emit(TransactionLoading());
      final response = await Dio(
        BaseOptions(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      ).post("https://tabcash-backend.nourmohamed.com/wallet/api/transfer/",
          data: {
            "to_wallet": user,
            "amount": money,
          });

      final transeferSucessModel = TranseferSucessModel.fromJson(response.data);
      emit(TransactionSuccess(transeferSucessModel));
    } on DioError catch (e) {
      print(e.toString());
      if (e.response!.statusCode == 400) {
        print(" mahmoud ahmed eroor ${e.response!.data["amount"][0]}");

        emit(TransactionExiption("There is not enough balance in your wallet"));
      }
      if (e.response!.statusCode == 401) {
        emit(TransactionFailure("You should login"));
      }
      if (e.response!.statusCode == 404) {
        emit(TransactionNotFound(e.response!.data["error"])); //
      }
    }
  }
}
