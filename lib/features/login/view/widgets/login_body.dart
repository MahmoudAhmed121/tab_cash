import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tab_cach/features/login/view/widgets/custom_login_sheet.dart';
import '../../../../../constant.dart';


class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: heightScreen*0.32,
            ),
          
            Expanded(
              child: SlideInUp(
                delay: const Duration(milliseconds: 1200),
                duration: const Duration(milliseconds: 600),
                from: 600,
                child: Stack(
                  children: [
                   
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                        color: kContainerColor,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomLoginModelSheet(
                            text: "Login",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
