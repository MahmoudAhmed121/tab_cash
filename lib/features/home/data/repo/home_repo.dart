import 'package:dartz/dartz.dart';
import 'package:tab_cach/core/utils/errors/failure.dart';
import 'package:tab_cach/features/home/data/model/balance_model.dart';
import 'package:tab_cach/features/home/data/model/home_model.dart';

abstract class HomeRepo {


 Future<Either<ServerFailure, StatisModel>>statisData();
 Future<Either<ServerFailure, BalanceModel>>balanceData();

}