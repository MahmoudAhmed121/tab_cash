import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tab_cach/features/regis/presentation/view/widgets/custom_regis_sheet.dart';

import '../../../../../constant.dart';

class RegisBody extends StatelessWidget {
  const RegisBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Expanded(
              child: SlideInUp(
                delay: const Duration(milliseconds: 1200),
                duration: const Duration(milliseconds: 600),
                from: 700,
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
                    CustomRegisSheet(
                      text: "Sign Up",
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
