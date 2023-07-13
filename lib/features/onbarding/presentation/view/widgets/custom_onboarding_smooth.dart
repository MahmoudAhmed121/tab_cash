import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constant.dart';

class CustomOnboardingSmooth extends StatelessWidget {
  const CustomOnboardingSmooth({Key? key, required this.activeIndex })
      : super(key: key);
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 3,
      effect: WormEffect(
        dotWidth: 9,
        dotHeight: 9,
        activeDotColor: kDotColor,
        dotColor: kContainerColor,
        spacing: 10,

      ),

    );
  }
}
