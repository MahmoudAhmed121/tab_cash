import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/features/setting/model/setting_model.dart';

class SettingBody extends StatelessWidget {
  SettingBody({super.key});
  final List<SettingModel> dataList = [
    SettingModel(
      "Language",
      "assets/images/lan.png",
    ),
    SettingModel(
      "Legals and constrains",
      "assets/images/clender.png",
    ),
    SettingModel(
      "Notifications",
      "assets/images/Vector.png",
    )
  ];
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: widthScreen,
        child: Column(
          children: [
            SizedBox(
              height: heightScreen * 0.062,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Container(
                height: 205,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: kContainerColor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: heightScreen * 0.092,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 26),
                            child: CustomSettingContent(
                              image: dataList[index].image,
                              text: dataList[index].text,
                              onTap: (){
                          
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSettingContent extends StatelessWidget {
  const CustomSettingContent({
    Key? key,
    required this.text,
    required this.image, required this.onTap,
  }) : super(key: key);
  final String text;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
      
        children: [
          Image.asset(
            image,
          ),
          SizedBox(
            width: 0.03,
          ),
          Text(
            text,
            style: GoogleFonts.josefinSans(fontSize: 16),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: kbackgroundbottomBar,
            size: 15,
          ),
          
        ],
      ),
    );
  }
}
