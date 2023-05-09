import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/features/transaction/presentation/view/widgets/custom_send_money_contact.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/model/transaction_model.dart';
import '../../manager/transaction/transaction_cubit.dart';

class CustomListView extends StatelessWidget {
  CustomListView({super.key});
final List<TransactionModel> userContact = [
  TransactionModel(
      image: Images.person6,
      name: "Nada Mohamed",
      phone: "01234567890"),
  TransactionModel(
      image: Images.person5,
      name: "Nouran Hosaam",
      phone: "01234543781"),
  TransactionModel(
    image: Images.person3,
    name: "Lila Ahmed",
    phone: "01257389467",
  ),
  TransactionModel(
      image:Images.person4,
      name: "Emain Sayed",
      phone: "01297463784"),
  TransactionModel(
      image: Images.person3
      ,
      name: "Yara Mahmoud",
      phone: "01236748963"),
  TransactionModel(
      image: Images.person2,
      name: "Tasneem Ziad",
      phone: "01287463829"),
  ];
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
          return InkWell(
            onTap: (){
              Get.to(CustomSendMoneyContact(image: userContact[index].image,name:userContact[index].name,phone:userContact[index].phone,));
            },
            child: FadeInRight(
              animate: true,
              delay: Duration(milliseconds: (index * 100) + 50),
              duration: Duration(milliseconds: (index * 100) + 400),
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
                            backgroundColor: kContainerColor,
                            backgroundImage: AssetImage(userContact[index].image),
                          ),
                        ),
                        SizedBox(
                          width: widthScreen*0.03,
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
                        size: 16,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}