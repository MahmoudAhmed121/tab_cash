import 'package:dartz/dartz.dart';
import 'package:tab_cach/core/utils/errors/failure.dart';
import 'package:tab_cach/features/children/data/model/child_model.dart';

abstract class ChildrenRepo{

  Future<Either<ServerFailure,List<ChildrenModel>>> childrenList();
}