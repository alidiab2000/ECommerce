import 'package:e_commerce/Feature/personailzation/controllers/user/user_controller.dart';
import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/helpers/network_manager.dart';
import '../../../../core/utils/popups/fullscreen_loader.dart';
import '../../../../core/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static LoginController get instance => Get.find();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override
  void onInit() {
    emailController.text = localStorage.read("REMEMBER_ME_EMAIL");
    passwordController.text = localStorage.read("REMEMBER_ME_PASSWORD");
    super.onInit();
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullscreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoading();
        return;
      }

      // Remember Me  save email and password
      if (rememberMe.value) {
        localStorage.write(
          "REMEMBER_ME_EMAIL",
          emailController.text.trim(),
        );
        localStorage.write(
          "REMEMBER_ME_PASSWORD",
          passwordController.text.trim(),
        );
      }
      // ignore: unused_local_variable
      final userCredential =
          await AuthenticationRepository.instance.loginUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Stop Loading
      FullscreenLoader.stopLoading();

      // Show Success SnackBar
      Loaders.successSnackBar(title: "Login Successful", message: "Welcome");
      // Go to Home Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullscreenLoader.stopLoading();
        return;
      }

      // ignore: unused_local_variable
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      //  Save Authanticated User data in the firestore
      userController.saveUserData(userCredential);
      // Stop Loading
      FullscreenLoader.stopLoading();

      // Show Success SnackBar
      Loaders.successSnackBar(title: "Login Successful", message: "Welcome");
      // Go to Home Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
