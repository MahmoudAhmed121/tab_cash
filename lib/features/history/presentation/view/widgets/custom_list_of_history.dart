import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_cach/core/widgets/custom_process.dart';
import 'package:tab_cach/features/history/presentation/manager/cubit/history_cubit.dart';

class CustomListOfHistory extends StatelessWidget {
  const CustomListOfHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return BlocConsumer<HistoryCubit, HistoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HistorySuccess) {
          final length = state.historyModel.length;
          return Container(
            height: heightScreen * 0.8,
            width: widthScreen,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: length,
              itemBuilder: (context, index) {
                final time = state.historyModel[index].dateCreated;
                final money = state.historyModel[index].amount;
                final type = state.historyModel[index].type;
                final wollet = state.historyModel[index].wallet;
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
        if (state is HistoryFailure) {
          print(state.errMessages);
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
