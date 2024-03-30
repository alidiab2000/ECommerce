import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/core/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/utils/exceptions/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  //variables
  final deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;
  //Call Form main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function To show Reletvant Screen
  screenRedirect() async {
    var isFirstTime = "isFirstTime";
    await deviceStorage.writeIfNull(isFirstTime, true);
    deviceStorage.read(isFirstTime) != true
        ? Get.offAllNamed(AppRoute.loginViewPath)
        : Get.offAndToNamed(AppRoute.root);
  }

  //Register User and Authenticate with email and password
  Future<UserCredential> registerUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , plz try again later";
    }
  }
}
