part of 'transfer_cubit.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}
class TransactionLoading extends TransactionState {}
class TransactionSuccess extends TransactionState {
  final TranseferSucessModel transeferSucessModel;
  TransactionSuccess(this.transeferSucessModel);
}

class TransactionFailure extends TransactionState {

  final String errorMessage;

  TransactionFailure(this.errorMessage);

}
