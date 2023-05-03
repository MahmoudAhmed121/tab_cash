import 'package:flutter/material.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/login/view/widgets/custom_buttom.dart';

class SendCode extends StatelessWidget {
  const SendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 30,
          ),
          child: ElevatedButton(
            onPressed: () {},
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
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 258, top: 268, left: 30, right: 30),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: kContainerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Will send a PIN code to\nactivate your account",
                      style: Style.textStyle30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: CustomButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SendCode();
                              },
                            ));
                          },
                          text: "Send"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
