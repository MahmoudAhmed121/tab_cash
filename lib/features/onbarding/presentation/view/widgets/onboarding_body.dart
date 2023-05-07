import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tab_cach/core/utils/shared/cache_helber.dart';
import 'package:tab_cach/core/utils/style.dart';
import 'package:tab_cach/features/login/presentation/view/login_view.dart';
import 'package:tab_cach/features/onbarding/presentation/view/widgets/custom_onboarding_smooth.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/assets.dart';
import 'package:lottie/lottie.dart';

import '../../data/repo/onboarding_repo.dart';
import '../manager/onboarding_boc/page_view_indicator_bloc.dart';
import '../manager/onboarding_boc/page_view_indicator_state.dart';

class OnboardingBody extends StatelessWidget {
   OnboardingBody({Key? key}) : super(key: key);
 final PageController nextPage = PageController();
 
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
void submit()async{
   await CacheHelber.saveData(key: "skip", value: true).then((value) {
    if(value){
  Get.to(LoginView());
    }
  });
}
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(Images.background_onboarding)),
          BlocBuilder<PageViewIndicatorBloc, IndicatorState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    height: heightScreen * 0.0713,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: widthScreen * 0.1),
                      child: TextButton(
                        onPressed: () {},
                        child: TextButton(
                          onPressed: submit,
                          child: Text(
                            "skip",
                            style: Style.textStyle26
                                .copyWith(color: kContainerColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * 0.06,
                  ),

                  Expanded(
                  flex: 1,
                    child: PageView.builder(

                        itemCount: onboardingList.length,
                        controller: nextPage,
                        onPageChanged: (value) {
                          state.page = value;
                          BlocProvider.of<PageViewIndicatorBloc>(context).add(IndicatorEvent());

                        },
                        itemBuilder: (context, index) => Container(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: heightScreen*0.21,
                                  ),
                                  Container(
                                    height: heightScreen*0.4,
                                    width: widthScreen*0.75,
                                    padding: EdgeInsets.symmetric(horizontal: widthScreen*0.06),
                                    decoration: BoxDecoration(
                                      color: kContainerColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(23)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        SizedBox(
                                          height: heightScreen*0.05,
                                        ),
                                        Text(
                                          "${onboardingList[index].title}",
                                          style: Style.textStyle24,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: heightScreen*0.02,
                                        ),
                                        Text(
                                          "${onboardingList[index].description}",
                                          style: Style.textStyle14
                                              .copyWith(color: kDescriptionText),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: heightScreen*0.25,
                                    width: widthScreen*0.5,
                                    child: Lottie.asset(
                                        "${onboardingList[index].animation}"),
                                  ),
                                  SizedBox(
                                    height: heightScreen*0.31,
                                  ),
                                  InkWell(
                                    onTap: () {
                                     if(index < onboardingList.length-1){
                                       nextPage.animateToPage(index + 1,
                                           duration: Duration(milliseconds: 900),
                                           curve: Curves.ease);
                                     }else{
                                      submit();
                                     }
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SvgPicture.asset(Images.polygon1),
                                        SizedBox(
                                            width: 70,
                                            child: SvgPicture.asset(Images.polygon1,color: kBackGroundColor,
                                            )),
                                        SvgPicture.asset(Images.arrow_right),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  CustomOnboardingSmooth(activeIndex: state.page),
                  SizedBox(
                    height: heightScreen*0.04,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }


}
