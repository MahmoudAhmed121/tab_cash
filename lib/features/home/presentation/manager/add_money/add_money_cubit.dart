import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';

part 'add_money_state.dart';

class AddMoneyCubit extends Cubit<AddMoneyState> {
  AddMoneyCubit() : super(AddMoneyInitial());
  
 Future<void> addMoney({required String card,required String cvv ,required String expiration_data,required String amount })async{
  final token  = await CacheHelber.getData(key: "token");
   try {
     final response= await Dio(BaseOptions( headers: {"Authorization": "Bearer ${token}"},),).post("https://tabcash-backend.nourmohamed.com/wallet/api/add-money-credit/",data: {
       "card_number":"5234567812345678",
       "cvv":"568",
       "expiration_data":"05/26",
       "amount": "100",
     });

    emit(AddMoneySuccess());
   } on DioError catch (e) {
     print(e);
if(e.response!.statusCode == 401){
  emit(AddMoneyFailure("you chould login"));
}


   }




 }
  
  
}
