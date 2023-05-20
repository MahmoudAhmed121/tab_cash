import 'package:bloc/bloc.dart';
import 'package:tab_cach/features/children/data/repo/children_repo_impl.dart';
import 'children_list_history_state.dart';

class ChikdrenListHistoryCubit extends Cubit<ChikdrenListHistoryState> {
  ChikdrenListHistoryCubit(this.childrenRepoImpl)
      : super(ChildrenListHistoryInitial());

  ChildrenRepoImpl childrenRepoImpl;
 
  Future<void> getListHestory() async{
    final data = await childrenRepoImpl.childrenListHistory();

    data.fold(
      (failure) {
        emit(
          ChiklrenListHistoryFailure(errorMessage: failure.errMessages),
        );
      },
      (list) {
        emit(ChiklrenListHistorySuccess(childrenListHistoryModel: list));
      },
    );
  }
}