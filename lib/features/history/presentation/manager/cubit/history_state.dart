part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}
class HistoryLoading extends HistoryState {}
class HistorySuccess extends HistoryState {
  final List<HistoryModel> historyModel;

  HistorySuccess(this.historyModel);
}
class HistoryFailure extends HistoryState {
  final String errMessages;

  HistoryFailure(this.errMessages);
}