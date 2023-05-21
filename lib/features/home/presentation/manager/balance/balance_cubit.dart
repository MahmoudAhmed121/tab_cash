import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tab_cach/features/home/data/model/balance_model.dart';
import 'package:tab_cach/features/home/data/repo/home_repo_impl.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit(this.homeRepoImpl) : super(BalanceInitial());

  final HomeRepoImpl homeRepoImpl;


  void getData() async{
  
   emit(BalanceLoading());

  final data= await homeRepoImpl.balanceData();
      data.fold(
        (failure) {
        
          emit(BalanceFailure(failure.errMessages));
        },
        (balanceData) {
        
          emit(BalanceSuccess(balanceModel: balanceData));
  print("get");
        },
      );
    }
   
  }


