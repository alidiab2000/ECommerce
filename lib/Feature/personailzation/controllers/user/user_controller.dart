import 'package:e_commerce/Feature/auth/models/user_model.dart';
import 'package:e_commerce/data/repositories/user/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../core/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameparts(userCredential.user!.displayName!);
        final userName =
            UserModel.generateUserName(userCredential.user!.displayName!);
        final user = UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email ?? " ",
          userName: userName,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          phoneNumber: userCredential.user!.phoneNumber ?? "",
          profilePicture: userCredential.user!.photoURL ?? "",
        );
     await userRepository.saveUserData(user: user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: "Data Not Saved",
          message:
              "Something went wrong when saving Your information, You can re-save your data in your profile");
    }
  }
}
