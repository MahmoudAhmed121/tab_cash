part of 'transaction_cubit.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}
class TransactionLoading extends TransactionState {}
class TransactionSuccess extends TransactionState {}
class TransactionExiption extends TransactionState {
  final String exption;

  TransactionExiption(this.exption);
}
class TransactionFailure extends TransactionState {

  final String errorMessage;

  TransactionFailure(this.errorMessage);

}
class TransactionNotFound extends TransactionState {

  final String errorMessage;

  TransactionNotFound(this.errorMessage);
}
