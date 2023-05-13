import 'package:dio/dio.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/features/children/data/model/child_model.dart';
import 'package:tab_cach/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tab_cach/features/children/data/repo/children_repo.dart';

class ChildrenRepoImpl implements ChildrenRepo {
  @override
  Future<Either<ServerFailure, List<ChildrenModel>>> childrenList() async {
    try {
      
      final token = await CacheHelber.getData(key: "token");
      final response = await Dio(
              BaseOptions(headers: {"Authorization": "Bearer ${token}"}))
          .get("https://tabcash-backend.nourmohamed.com/wallet/api/kid-list/");
      List<dynamic> responseData = response.data;
      List<ChildrenModel> dataList = responseData
          .map((jsounDecode) => ChildrenModel.fromJson(jsounDecode))
          .toList();
      return right(dataList);
    } on DioError catch (e) {
      print("magmoud eroor ${e.response!.data.toString()}");
      return left(ServerFailure.fromDioError(e));
    }
  }
}
