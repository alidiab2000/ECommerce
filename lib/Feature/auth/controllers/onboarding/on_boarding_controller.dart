import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/utils/common/routes/app_router.dart';

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
      var isFirstTime = "isFirstTime";
      final storage = GetStorage();
      storage.write(isFirstTime, false);
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
  void skipOnBoarding() {
    var isFirstTime = "isFirstTime";
    final storage = GetStorage();
    storage.write(isFirstTime, false);
    Get.offAllNamed(
      AppRoute.loginViewPath,
    );
  }
}
