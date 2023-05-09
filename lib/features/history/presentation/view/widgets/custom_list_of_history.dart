import 'package:flutter/material.dart';
import 'package:tab_cach/core/widgets/custom_process.dart';

import '../../data/model/process_model.dart';
import '../../data/repo/history_repo.dart';

class CustomListOfHistory extends StatelessWidget {
  const CustomListOfHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Container(
      height: heightScreen*0.8,
      width: widthScreen,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: listOfHistoryRepo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(bottom: heightScreen*0.015),
              child: CustomProcess(
                  title:listOfHistoryRepo[index].title,
                  date:listOfHistoryRepo[index].date ,
                  time:listOfHistoryRepo[index].time ,
                  money:listOfHistoryRepo[index].money ),
            );
          }
      ),
    );
  }
}
