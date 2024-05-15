import 'package:e_commerce/Feature/personailzation/controllers/user/user_controller.dart';
import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/helpers/network_manager.dart';
import '../../../../core/utils/popups/fullscreen_loader.dart';
import '../../../../core/utils/popups/loaders.dart';
import '../../../shop/controllers/navigation_bar_menu.dart/navigation_bar_menu_controller.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  late SharedPreferences prefs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final navigationMenuController = Get.put(NavigationMenuController());
  static LoginController get instance => Get.find();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    try {
      bool? email = prefs.containsKey("REMEMBER_ME_EMAIL");
      if (email ) {
        emailController.text = prefs.getString("REMEMBER_ME_EMAIL") ?? '';
        passwordController.text = prefs.getString("REMEMBER_ME_PASSWORD") ?? '';
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are processing your request", AppImages.docerAnimatioin);
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

      // Remember Me save email and password
      if (rememberMe.value) {
        prefs.setString(
          "REMEMBER_ME_EMAIL",
          emailController.text.trim(),
        );
        prefs.setString(
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

      navigationMenuController.selectedIndex.value = 0;

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
          "We are processing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullscreenLoader.stopLoading();
        return;
      }

      // ignore: unused_local_variable
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save Authenticated User data in the firestore
      userController.saveUserData(userCredential);
      // Stop Loading
      FullscreenLoader.stopLoading();

      // Show Success SnackBar
      Loaders.successSnackBar(title: "Login Successful", message: "Welcome");
      navigationMenuController.selectedIndex.value = 0;

      // Go to Home Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
