import 'package:flutter/material.dart';
import 'package:tab_cach/constant.dart';

import '../../../../../core/widgets/custom_text_form_faild.dart';


Future<void> showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,

    barrierDismissible: false,
    builder: (BuildContext context) {
      double heightScreen = MediaQuery.of(context).size.height;
      double widthScreen = MediaQuery.of(context).size.width;

      return AlertDialog(
        backgroundColor: kContainerColor,
        title:  Text('Add children'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              CustomTextFormFaild(
                hintText: "Name",
                obscureText: false,

              ),
              SizedBox(height: heightScreen*0.02,),
              CustomTextFormFaild(
                hintText: "Phone Number",
                obscureText: false,

              ),
              SizedBox(height: heightScreen*0.02,),
              CustomTextFormFaild(
                hintText: "Password",
                obscureText: false,

              ),

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}