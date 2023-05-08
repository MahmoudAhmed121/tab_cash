import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/features/home/data/model/home_model.dart';
import 'package:tab_cach/features/home/data/repo/home_repo_impl.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit(this.homeRepoImpl) : super(StatisticsInitial());

  HomeRepoImpl homeRepoImpl;

  Future<void> getStatis() async {
    emit(StatisticsLoading());
    final data = await HomeRepoImpl().statisData();

    data.fold(
      (failure) {
        emit(StatisticsFailure(failure.errMessages));
      },
      (data) {
        emit(StatisticsSuccess(data));
      },
    );
  }
}
