import 'package:e_commerce/Feature/auth/models/user_model.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:e_commerce/data/repositories/user/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/helpers/network_manager.dart';
import '../../../../core/utils/popups/fullscreen_loader.dart';
import '../../../../core/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  final user = UserModel.empty().obs;
  //Re auth vars
  final reAuthFormKey = GlobalKey<FormState>();
  final reAuthHidePassword = true.obs;
  final reAuthEmailController = TextEditingController();
  final reAuthPasswordController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    await fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      profileLoading(true);
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      //Refresh Data
      await fetchUserData();

      //If no record already exist
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //Convert Name To first and Last Name
          final nameParts =
              UserModel.nameparts(userCredential.user!.displayName!);
          final userName =
              UserModel.generateUserName(userCredential.user!.displayName!);

          //Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email ?? " ",
            userName: userName,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            profilePicture: userCredential.user!.photoURL ?? "",
          );
          await userRepository.saveUserData(user: user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: "Data Not Saved",
          message:
              "Something went wrong when saving Your information, You can re-save your data in your profile");
    }
  }

  void deletAccountWarinngPopup() {
    Get.defaultDialog(
      title: "Delete Account",
      contentPadding: const EdgeInsets.all(CustomSizes.sm),
      middleText: "Are you sure you want to delete your account?",
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
      confirm: ElevatedButton(
        onPressed: () async => deletUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomSizes.lg),
          child: Text("Delete"),
        ),
      ),
    );
  }

  void deletUserAccount() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);

      //Re Authanticate User then Delete Account
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deletAccount();
          FullscreenLoader.stopLoading();
          Get.offAndToNamed(AppRoute.loginViewPath);
        } else if (provider == "password") {
          FullscreenLoader.stopLoading();
          Get.toNamed(AppRoute.reAuthLoginFormViewPath);
        }
      }
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.warningSnackBar(title: "Warning", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", AppImages.docerAnimatioin);
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullscreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateEmailAndPasswordUser(
              email: reAuthEmailController.text.trim(),
              password: reAuthPasswordController.text.trim());
      await AuthenticationRepository.instance.deletAccount();
      FullscreenLoader.stopLoading();
      await Get.offAndToNamed(AppRoute.loginViewPath);
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 521,
      );

      if (image != null) {
        imageUploading.value = true;
        //Get image from gallery
        final imageUrl = await userRepository.uploadImage(
            path: "Users/Images/Profile/", image: image);
        //Convert image url to json
        final json = {"profilePicture": imageUrl};
        //Update single field (User Image Profile)
        userRepository.updateSingleField(json: json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        Loaders.successSnackBar(
          title: "Success",
          message: "Your Profile Picture Updated Successfully",
        );
      }
    } catch (e) {
      Loaders.warningSnackBar(title: "Warning", message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
