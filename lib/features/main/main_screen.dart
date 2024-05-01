import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:kelasdigital/configs/kd_assets/app_assets.dart';
import 'package:kelasdigital/configs/kd_styles/app_styles.dart';
import 'package:kelasdigital/features/calendar/calendar_screen.dart';
import 'package:kelasdigital/features/conversation/conversation_screen.dart';
import 'package:kelasdigital/features/dashboard/dashboard_screen.dart';
import 'package:kelasdigital/features/home/home_screen.dart';
import 'package:kelasdigital/features/market/market_screen.dart';
import 'package:kelasdigital/utils/translation/app_translation.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'controller/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.bottomController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        adjustScreenBottomPaddingOnCurve: true,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
      navBarHeight: 65,
    );
  }

  List<Widget> _buildScreens() {
    return [
      _mainScreen(child: const HomeScreen()),
      _mainScreen(child: const DashboardScreen()),
      _mainScreen(child: const ConversationScreen()),
      _mainScreen(child: const CalendarScreen()),
      _mainScreen(child: const MarketScreen()),
    ];
  }

  Widget _mainScreen({required Widget child}) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Obx(
              () => !controller.isConnectedToNetwork.value
                  ? controller.showBar
                  : Container(),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.home_outlined),
        title: AppTranslateString.home.tr,
        activeColorPrimary: KdColor.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: KdColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.assessment_outlined),
        title: AppTranslateString.dashboard.tr,
        activeColorPrimary: KdColor.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: KdColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          padding: const EdgeInsets.only(bottom: 4),
          child: Image.asset(KdAssetsImagesPath.logosIcon),
        ),
        title: AppTranslateString.classroom.tr.toUpperCase(),
        textStyle: KdTextStyles.caption2Medium,
        activeColorSecondary: KdColor.primary70,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: KdColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.date_range_outlined),
        title: AppTranslateString.calendar.tr,
        activeColorPrimary: KdColor.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: KdColor.greyColor,
      ),
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.storefront_outlined),
        title: AppTranslateString.market.tr,
        activeColorPrimary: KdColor.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: KdColor.greyColor,
      ),
    ];
  }
}
