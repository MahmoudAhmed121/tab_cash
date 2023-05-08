
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/model/transaction_model.dart';
import '../../../data/repo/contact_repo.dart';

class CustomListView extends StatelessWidget {
  CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      height: heightScreen*.5,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: userContact.length,
        itemBuilder: (context, index) {
          return FadeInRight(
            duration: Duration(milliseconds: (index * 100) + 500),
            child: Container(
              height: heightScreen*0.1,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.only(left: widthScreen*0.06),
              decoration: BoxDecoration(
                  color: ktextWoletColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Row(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red[100],
                          backgroundImage: AssetImage(userContact[index].image),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${userContact[index].name}",
                        style:  GoogleFonts.josefinSans(textStyle: Style.textStyle16,color: kContainerColor),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: kContainerColor,
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