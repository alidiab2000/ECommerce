import 'package:e_commerce/core/utils/common/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  //variables
  final pageController = PageController();
  final currentPageIndex = 0.obs;

  //Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump tp The sepcific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update current inex & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAllNamed(
        AppRoute.loginViewPath,
      );
    } else {
      pageController.jumpToPage(
        currentPageIndex.value + 1,
      );
    }
  }

  //Update Current Index and Jump To last page
  void skipOnBoarding() => Get.offAllNamed(
        AppRoute.loginViewPath,
      );
}
