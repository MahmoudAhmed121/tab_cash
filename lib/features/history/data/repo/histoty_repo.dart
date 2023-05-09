import 'package:dartz/dartz.dart';
import 'package:tab_cach/core/utils/errors/failure.dart';
import 'package:tab_cach/features/history/data/model/history_model.dart';

abstract class HistoryRepo{

  Future<Either<ServerFailure,HistoryModel>>getHistoryData();
}