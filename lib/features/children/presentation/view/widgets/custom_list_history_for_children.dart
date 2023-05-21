import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_cach/core/widgets/custom_process.dart';
import 'package:tab_cach/features/children/presentation/manager/children_list_history.dart/children_list_history_state.dart';

import '../../manager/children_list_history.dart/children_list_history_cubit.dart';

class CustomListOfChildrenHistory extends StatelessWidget {
  const CustomListOfChildrenHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return BlocConsumer<ChildrenListHistoryCubit, ChikdrenListHistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ChiklrenListHistorySuccess) {
          final length = state.childrenListHistoryModel.length;
          return Container(
            height: heightScreen * 0.8,
            width: widthScreen,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: length,
              itemBuilder: (context, index) {
                final time = state.childrenListHistoryModel[index].dateCreated;
                final money = state.childrenListHistoryModel[index].amount;
                final type = state.childrenListHistoryModel[index].type;
                final wollet = state.childrenListHistoryModel[index].wallet;
                return Padding(
                  padding: EdgeInsets.only(bottom: heightScreen * 0.015),
                  child: CustomProcess(
                    title: type,
                    date: wollet,
                    time: time,
                    money: money,
                  ),
                );
              },
            ),
          );
        }
        if (state is ChiklrenListHistoryFailure) {
          print(state.errorMessage);
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
