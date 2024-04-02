import 'dart:async';
import 'package:e_commerce/core/utils/common/widgets/login_sigup/commen_widget/screens/success.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/constants/text_strings.dart';
import 'package:e_commerce/core/utils/popups/loaders.dart';
import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifiyController extends GetxController {
  static VerifiyController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerificatiion();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification link
  Future<void> sendEmailVerificatiion() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerifivation();
      Loaders.successSnackBar(title: "Email Sent", message: "Check your mail");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }

  //Timer to auto redirect on Email Verification
  Future<void> setTimerForAutoRedirect() async {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) async {
        FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;

        if (user?.emailVerified ?? false) {
          timer.cancel();
          await Get.to(
            () => SuccessView(
              image: AppImages.successRegisterAnimation,
              title: AppTexts.yourAccountCreatedTitle,
              subTitle: AppTexts.yourAccountCreatedSubTitle,
              onPressed: AuthenticationRepository.instance.screenRedirect,
            ),
          );
        } else {
          debugPrint("===================Email not verified=================");
        }
      },
    );
  }

  //Manually check for Email Verification
  checkEmailVerificationStates() async {
    debugPrint("===================Email Verified=================");
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      await Get.to(
        () => SuccessView(
          image: AppImages.successRegisterAnimation,
          title: AppTexts.yourAccountCreatedTitle,
          subTitle: AppTexts.yourAccountCreatedSubTitle,
          onPressed: AuthenticationRepository.instance.screenRedirect,
        ),
      );
    }
  }
}
