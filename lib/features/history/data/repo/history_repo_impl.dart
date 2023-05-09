
import 'package:dio/dio.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/history/data/model/history_model.dart';
import 'package:tab_cach/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tab_cach/features/history/data/repo/histoty_repo.dart';

class HisterRepoImpl implements HistoryRepo {
  @override
  Future<Either<ServerFailure, HistoryModel>> getHistoryData() async {
    HistoryModel historyModel;
    try {
      final token = await CacheHelber.getData(key: "token");
      final response = await Dio(
        BaseOptions(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      ).get(
          "https://tabcash-backend.nourmohamed.com/wallet/api/transaction-list/");
      final data = HistoryModel.fromJson(response.data);
      return right(data);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}
