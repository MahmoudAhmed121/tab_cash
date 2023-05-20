import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tab_cach/features/home/data/model/balance_model.dart';
import 'package:tab_cach/features/home/data/repo/home_repo_impl.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit(this.homeRepoImpl) : super(BalanceInitial());

  final HomeRepoImpl homeRepoImpl;

  StreamController<BalanceState> _dataStreamController = StreamController<BalanceState>();
  Stream<BalanceState> get dataStream => _dataStreamController.stream;

  void getData() {
    _dataStreamController.sink.add(BalanceLoading());

    homeRepoImpl.balanceData().then((data) {
      data.fold(
        (failure) {
          _dataStreamController.sink.add(BalanceFailure(failure.errMessages));
          emit(BalanceFailure(failure.errMessages));
        },
        (balanceData) {
          _dataStreamController.sink.add(BalanceSuccess(balanceModel: balanceData));
          emit(BalanceSuccess(balanceModel: balanceData));

        },
      );
    }).catchError((e) {
      _dataStreamController.sink.addError(e.toString());
      emit(BalanceFailure(e.toString()));
    });

    Future.delayed(Duration(seconds: 5), getData);
  }

  @override
  Future<void> close() {
    _dataStreamController.close();
    return super.close();
  }
}
