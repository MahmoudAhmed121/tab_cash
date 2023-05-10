part of 'statistics_cubit.dart';

@immutable
abstract class StatisticsState {}

class StatisticsInitial extends StatisticsState {}
class StatisticsLoading extends StatisticsState {}
class StatisticsSuccess extends StatisticsState {
  final StatisModel statisModel;

  StatisticsSuccess(this.statisModel);

}
class StatisticsFailure extends StatisticsState {
  final String erorrMessage;

  StatisticsFailure(this.erorrMessage);

}
