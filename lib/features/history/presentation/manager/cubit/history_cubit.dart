import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/features/history/data/model/history_model.dart';
import 'package:tab_cach/features/history/data/repo/history_repo_impl.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.histerRepoImpl) : super(HistoryInitial());

  HisterRepoImpl histerRepoImpl;

  static HistoryCubit get(context) => BlocProvider.of(context);

  Future<void> data() async {
    final data = await histerRepoImpl.getHistoryData();

    data.fold((failure) {
      emit(HistoryFailure(failure.errMessages));
    }, (historyData) {
      emit(HistorySuccess(historyData));
    });
  }
}
