import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_cach/core/utils/assets.dart';
import 'package:tab_cach/core/utils/finger_print.dart';


class SplachBody extends StatefulWidget {
  const SplachBody({super.key});

  @override
  State<SplachBody> createState() => _SplachBodyState();
}

class _SplachBodyState extends State<SplachBody> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () async {
       
        FingerPrint().authAuth(context);
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.logo),
          ],
        ),
      ),
    );
  }
}
