 
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';
import '../loaders/animation_loader.dart';

class FullscreenLoader {
  static void openLoadingDialog(String? text, String? animation) {
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? AppColors.dark
              : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              AnimationLoader(
                text: text!,
                animation: animation!,
              )
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
