part of 'add_money_cubit.dart';

@immutable
abstract class AddMoneyState {}

class AddMoneyInitial extends AddMoneyState {}
class AddMoneyLoading extends AddMoneyState {}
class AddMoneySuccess extends AddMoneyState {}
class AddMoneyFailure extends AddMoneyState {
  final String errorMessage;

  AddMoneyFailure(this.errorMessage);
}
