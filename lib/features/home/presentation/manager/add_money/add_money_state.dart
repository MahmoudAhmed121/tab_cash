part of 'add_money_cubit.dart';

@immutable
abstract class AddMoneyState {}

class AddMoneyInitial extends AddMoneyState {}
class AddMoneyLoading extends AddMoneyState {}
class AddMoneySuccess extends AddMoneyState {
  final String message;

  AddMoneySuccess(this.message);

}
class AddMoneyFailure extends AddMoneyState {
  final String errorMessage;

  AddMoneyFailure(this.errorMessage);
}
class AddMoneyExption extends AddMoneyState {
  final String errorMessage;

  AddMoneyExption(this.errorMessage);
}
