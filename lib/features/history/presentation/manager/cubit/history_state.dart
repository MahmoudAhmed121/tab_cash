part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}
class HistoryLoading extends HistoryState {}
class HistoryFailure extends HistoryState {}
class HistorySuccess extends HistoryState {}
