// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'balance_cubit.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}
class BalanceLoading extends BalanceState {}
class BalanceSuccess extends BalanceState {
  final BalanceModel balanceModel;

  BalanceSuccess({required this.balanceModel});
}
class BalanceFailure extends BalanceState {
  final String errMessages;

  BalanceFailure(this.errMessages);
}
class BalanceStreen extends BalanceState {
  StreamController<BalanceState> streamController;
  BalanceStreen({
    required this.streamController,
  });
  
}
