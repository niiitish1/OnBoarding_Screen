import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:on_boarding_screen/on_boarding_info.dart';
import 'package:get/state_manager.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLAstPage => selectedPageIndex.value == onBoardingPages.length - 1;
  nextPages() {
    if (!isLAstPage) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
        imageAssets: "assets/order.png",
        description:
            'Now you can order your food any time right from your mobile1',
        title: 'Order Your Food'),
    OnBoardingInfo(
        imageAssets: "assets/cook.png",
        description:
            'We are maintain safety and we keep clean While making food',
        title: 'Cooking Safe Food'),
    OnBoardingInfo(
        imageAssets: "assets/deliver.png",
        description: 'Order your favourite meal and get deleviry immediately',
        title: 'Quick Deleviry'),
  ];
}
