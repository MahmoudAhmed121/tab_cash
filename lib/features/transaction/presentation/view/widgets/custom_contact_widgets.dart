

import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tab_cach/features/transaction/data/model/transaction_model.dart';


class CustomAnimationContact extends StatelessWidget {
   CustomAnimationContact({super.key});
final List<TransactionModel>  userContact = [
  TransactionModel(image: "assets/images/1.png",name: "nada"),
  TransactionModel(image: "assets/images/2.png",name: "Nouran"),
  TransactionModel(image: "assets/images/3.png",name: "Lila"),
  TransactionModel(image: "assets/images/4.png",name: "Emain"),
  TransactionModel(image: "assets/images/5.png",name: "Yara"),
  TransactionModel(image: "assets/images/6.png",name: "Tasneem"),
];
  @override
  Widget build(BuildContext context) {
    return  FadeInUp(
            duration: Duration(milliseconds: 500),
            child: Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.all(90.0),
             
              child: Stack(
                children: [
                  for (double i = 0; i < 360; i += 60)
                    AnimChain(initialDelay: Duration(milliseconds: i.toInt()))
                        .next(
                          wait: Duration(milliseconds: 1000),
                          widget: AnimatedAlignPositioned(
                            dx: 0,
                            dy: 150,
                            duration: Duration(seconds: 1),
                            rotateDegrees: 0,
                            touch: Touch.middle,
                            child: user(0, i),
                          ),
                        )
                        .next(
                          wait: Duration(seconds: 2),
                          widget: AnimatedAlignPositioned(
                            dx: i / 360,
                            dy: 150,
                            duration: Duration(seconds: 1),
                            rotateDegrees: i,
                            touch: Touch.middle,
                            child: user(0, i),
                          ),
                        ),
                ],
              ),
            ),
          );
          
  }


   user(int index, double number) {
    index = number ~/ 60;
    return FadeInRight(
      delay: Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context,
          //   MaterialPageRoute(
          //     builder: (context) => SendMoney(
          //       name: _contacts[index]['name'],
          //       avatar: _contacts[index]['avatar']
          //     )
          //   )
          // );
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(userContact[index].image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}