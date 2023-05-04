import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';

class SendCode extends StatelessWidget {
  const SendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 368,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: kContainerColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A PIN will be send to you",
                    style: Style.textStyle26.copyWith(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Lottie.asset("assets/animations/loading.json",
                  height: 100
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 85,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 30,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded),
          style: ElevatedButton.styleFrom(
            backgroundColor: kButtomBack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      backgroundColor: kBackGroundColor,
      elevation: 0,
    );
  }

}
