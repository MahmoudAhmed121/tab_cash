import 'package:dio/dio.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/home/data/model/balance_model.dart';
import 'package:tab_cach/features/home/data/model/home_model.dart';
import 'package:tab_cach/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tab_cach/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<ServerFailure, StatisModel>> statisData() async {
    StatisModel homeModel;
    try {
      final token = await CacheHelber.getData(key: "token");
      final response = await Dio(
        BaseOptions(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      ).get("https://tabcash-backend.nourmohamed.com/wallet/api/insights/");

      final homeModel = StatisModel.fromJson(response.data);

      return right(homeModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, BalanceModel>> balanceData() async {
    BalanceModel balanceModel;
    try {
      final token = await CacheHelber.getData(key: "token");
      final response = await Dio(
        BaseOptions(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      ).get("https://tabcash-backend.nourmohamed.com/accounts/api/balance/");

      final balanceModel = BalanceModel.fromJson(response.data);
      return right(balanceModel);
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }
}