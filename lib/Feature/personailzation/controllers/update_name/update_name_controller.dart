import 'package:e_commerce/Feature/personailzation/controllers/user/user_controller.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/data/repositories/user/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/helpers/network_manager.dart';
import '../../../../core/utils/popups/fullscreen_loader.dart';
import '../../../../core/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final updateNameFormKey = GlobalKey<FormState>();
  final userRepository = Get.put(UserRepository());
  final userController = UserController.instance;
  final isUserNameChanged = false.obs;

  static UpdateNameController get instance => Get.find();
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstNameController.text = userController.user.value.firstName;
    lastNameController.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      isUserNameChanged.value = true;
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //Form Validation
      if (!updateNameFormKey.currentState!.validate()) return;

      // Add User to firestore
      Map<String, dynamic> userName = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
      };
      await userRepository.updateSingleField(json: userName);

      // Remove loader
      FullscreenLoader.stopLoading();
      //Ferch User Data
      userController.user.value.firstName = firstNameController.text.trim();
      userController.user.value.lastName = lastNameController.text.trim();

      // Navigate to verification Screen
      Get.offNamed(AppRoute.profileViewPath);
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isUserNameChanged.value = false;
    }
  }
}
