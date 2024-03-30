import 'package:e_commerce/Feature/auth/models/user_model.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/popups/loaders.dart';
import 'package:e_commerce/data/repositories/user/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/helpers/network_manager.dart';
import '../../../../core/utils/popups/fullscreen_loader.dart';
import '../../../../data/repositories/auth/auth_repo.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  //Implement registerController variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  Future<void> register() async {
    // Start Loading
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Provacy Policy Checked
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create an account, you must reaba and accept the Privacy policy && Terms of Use",
        );
        return; // Stop Loading
      }

      //Register User in the Firebase Authantication and Save user data
      final userCredential = await AuthenticationRepository.instance
          .registerUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      // Save Authanticated User data in the firestore
      final newUser = UserModel(
        email: email.text.trim(),
        userName: userName.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
        id: userCredential.user!.uid,
      );

      // Add User to firestore
      final userRepo = Get.put(UserRepository());
      userRepo.saveUserData(user: newUser);






      
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    } finally {
      FullscreenLoader.stopLoading();
    }
  }
}
