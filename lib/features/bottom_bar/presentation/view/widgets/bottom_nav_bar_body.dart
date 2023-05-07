import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tab_cach/features/children/presentation/view/children_view.dart';
import 'package:tab_cach/constant.dart';
import 'package:tab_cach/features/history/presentation/view/historyview.dart';
import 'package:tab_cach/features/transaction/presentation/view/transaction_view.dart';

import '../../../../payments/presentation/view/payments_view.dart';


class BottomNavBarBody extends StatelessWidget {
  const BottomNavBarBody({super.key});
  List<Widget> _buildScreens() {
    return [
      
      TransactionView(),
      HistoryView(),
      PaymentsView(),
      ChildrenView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Iconsax.home),
        title: ("Home"),
        activeColorPrimary: kPinActiveBorder,
        inactiveColorPrimary: kBackGroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Iconsax.card_send,),
        title: ("Transaction"),
        activeColorPrimary: kPinActiveBorder,
        inactiveColorPrimary: kBackGroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Iconsax.arrow_swap),
        title: ("History"),
        activeColorPrimary: kPinActiveBorder,
        inactiveColorPrimary: kBackGroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesome.address_book_o),
        title: ("Payments"),
        activeColorPrimary: kPinActiveBorder,
        inactiveColorPrimary: kBackGroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesome.address_book_o),
        title: ("Children"),
        activeColorPrimary: kPinActiveBorder,
        inactiveColorPrimary: kBackGroundColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        navBarHeight: 50,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: kbackgroundbottomBar,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(45),
          colorBehindNavBar: kBackGroundColor,
        ),
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOutQuad,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
