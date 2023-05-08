import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import 'package:tab_cach/features/regis/presentation/view/widgets/custom_send_code_body.dart';
import 'package:tab_cach/features/transaction/presentation/view/widgets/custom_contact_widgets.dart';

import '../../../../../core/widgets/appbar.dart';
import '../../../data/model/transaction_model.dart';

class TransactionBody extends StatelessWidget {
   TransactionBody({Key? key}) : super(key: key);

  final SendCode sendCode = SendCode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            CustomAnimationContact(),
            SizedBox(
              height: 30,
            ),
            FadeInRight(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 10.0),
                child: Text(
                  'All Contacts',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            CustomListView()
          ],
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  CustomListView({super.key});
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
    return Container(
      height: MediaQuery.of(context).size.height - 200,
      padding: EdgeInsets.only(left: 20),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: userContact.length,
        itemBuilder: (context, index) {
          return FadeInRight(
            duration: Duration(milliseconds: (index * 100) + 500),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: <Widget>[
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red[100],
                        backgroundImage: AssetImage(userContact[index].image),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${userContact[index].name}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
