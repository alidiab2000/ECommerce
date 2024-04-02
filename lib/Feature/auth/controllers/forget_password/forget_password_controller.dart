import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/helpers/network_manager.dart';
import '../../../../core/utils/popups/fullscreen_loader.dart';
import '../../../../core/utils/popups/loaders.dart';
import '../../../../data/repositories/auth/auth_repo.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  final emailController = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) return;

      // Send Password Reset Email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      // Remove loader
      FullscreenLoader.stopLoading();
      // Show Snack Bar
      Loaders.successSnackBar(
          title: "Success", message: "Email link Sent to reset password");

      Get.toNamed(AppRoute.resetPasswordviewPath,
          arguments: emailController.text.trim());
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  resendPassRestEmail({required String email}) async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) return;

      // Send Password Reset Email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email: email);
      // Remove loader
      FullscreenLoader.stopLoading();
      // Show Snack Bar
      Loaders.successSnackBar(
          title: "Success", message: "Email link Sent to reset password");
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
