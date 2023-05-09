import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/repo/children_repo.dart';


class CustomListOfChildren extends StatelessWidget {
  const CustomListOfChildren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Container(
      height: heightScreen*0.18,
      width: widthScreen,
      padding: EdgeInsets.only(left:widthScreen*0.03),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context,index){
            return Container(
              width: heightScreen*0.2,
              margin: EdgeInsets.only(right:widthScreen*0.031),
              padding: EdgeInsets.symmetric(horizontal:widthScreen*0.02 ,vertical: heightScreen*0.01 ),
              decoration: BoxDecoration(
                color: ktextWoletColor ,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: heightScreen*0.05,
                        width: widthScreen*0.09,
                          margin: EdgeInsets.only(right: widthScreen*0.02),
                          child: Image.asset(ListOfChildren[index].image)
                      ),
                      SizedBox(
                        child: Text(
                          "${ListOfChildren[index].name}",
                          style: GoogleFonts.inter(
                              textStyle: Style.textStyle18,
                              color: kContainerColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: (){},
                          icon:Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),

                  SizedBox(height: heightScreen*0.023,),
                  Text(
                    "  Balance",
                    style: GoogleFonts.inter(
                        textStyle: Style.textStyle14,
                        color: kPinActiveBorder,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: heightScreen*0.004,),
                  Text(
                    "  \$${ListOfChildren[index].balance}",
                    style: GoogleFonts.inter(
                        textStyle: Style.textStyle18,
                        color: kContainerColor,
                        fontWeight: FontWeight.w400),
                  ),

                ],
              ),
            );
          }
      ),
    );
  }
}
