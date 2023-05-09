import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';

class CustomAddMoneyTextFields extends StatelessWidget {
   CustomAddMoneyTextFields({Key? key ,required this.title,required this.hintText, required this.widthField, required this.heightField, required this.textEditingController,required this.validator}) : super(key: key);
   final String title ;
   final String hintText ;
   final double widthField ;
   final double heightField ;
   final TextEditingController  textEditingController;
   String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: GoogleFonts.prompt(
              textStyle: Style.textStyle18, color: kbackgroundbottomBar,fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightScreen*0.01,),
        Container(
          height: heightField,
          width: widthField,
          child: TextFormField(
            controller: textEditingController,
            validator: validator,
            keyboardType: TextInputType.number,
            style: Style.textStyle24.copyWith(color:kContainerColor),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Style.textStyle16.copyWith(color: kDescriptionText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kDividerColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kDividerColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kTextFormFieldBorder),
              ),
            ),


          ),
        ),
      ],
    );
  }
}
