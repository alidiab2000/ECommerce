import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Loaders {
  static successSnackBar({required String title, message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColors.white,
        backgroundColor: AppColors.primary,
        isDismissible: true,
        shouldIconPulse: true,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: AppColors.white));
  }

  static warningSnackBar({required String title, message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        isDismissible: true,
        shouldIconPulse: true,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: AppColors.white));
  }

  static errorSnackBar({required String title, message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade600,
        isDismissible: true,
        shouldIconPulse: true,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: AppColors.white));
  }
}
