import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/style.dart';
import '../../../data/repo/list_of_slider_repo.dart';

class CustomSliderDiscount extends StatefulWidget {
  const CustomSliderDiscount({Key? key}) : super(key: key);

  @override
  State<CustomSliderDiscount> createState() => _CustomSliderDiscountState();
}

class _CustomSliderDiscountState extends State<CustomSliderDiscount> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return CarouselSlider.builder(
      itemCount: listOfSliderRepo.length,
      itemBuilder: (context, index, realIndex) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: widthScreen*0.05),
              decoration: BoxDecoration(
                color: listOfSliderRepo[index].color,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    listOfSliderRepo[index].title,
                    style: GoogleFonts.prompt(
                      textStyle: Style.textStyle20,
                      color: kContainerColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: heightScreen*0.012,),
                  Text(
                    listOfSliderRepo[index].description,
                    style: GoogleFonts.prompt(
                      textStyle: Style.textStyle14,
                      color: kContainerColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      },
      options: CarouselOptions(
        height: heightScreen *0.25,
        aspectRatio: 16 / 9,
        viewportFraction: 0.85,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1700),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
    );
  }
}
