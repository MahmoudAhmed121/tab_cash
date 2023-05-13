

import '../../../data/model/children_list_history_model.dart';

abstract class ChikdrenListHistoryState {}

class ChildrenListHistoryInitial extends ChikdrenListHistoryState {}
class ChiklrenListHistoryLoading extends ChikdrenListHistoryState {}
class ChiklrenListHistorySuccess extends ChikdrenListHistoryState {
 List<ChildrenListHistoryModel> childrenListHistoryModel;

ChiklrenListHistorySuccess({required this.childrenListHistoryModel});
}
class ChiklrenListHistoryFailure extends ChikdrenListHistoryState {
  final String errorMessage ;

  ChiklrenListHistoryFailure({required this.errorMessage});


}
