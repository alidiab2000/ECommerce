import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/core/utils/exceptions/platform_exceptions.dart';
import 'package:e_commerce/data/repositories/user/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/utils/exceptions/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  //variables
  final deviceStorage = GetStorage();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  final authUser = FirebaseAuth.instance.currentUser;
  //Call Form main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function To show Reletvant Screen
  screenRedirect() async {
    final User? user = _auth.currentUser;

    if (user != null) {
      debugPrint("===================User Logged In=================");
      if (user.emailVerified) {
        Get.offAllNamed(AppRoute.navigationMenuPath);
      } else {
        Get.offAllNamed(AppRoute.verifyViewPath,
            arguments: _auth.currentUser!.email);
      }
    } else {
      debugPrint("=================== User Not Logged In=================");

      var isFirstTime = "isFirstTime";
      await deviceStorage.writeIfNull(isFirstTime, true);
      deviceStorage.read(isFirstTime) != true
          ? Get.offAllNamed(AppRoute.loginViewPath)
          : Get.offAndToNamed(AppRoute.onBoardingView);
    }
  }

  //Login User and Authenticate with email and password
  Future<UserCredential> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  //Register User and Authenticate with email and password
  Future<UserCredential> registerUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
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

  // Verify Email
  Future<void> sendEmailVerifivation() async {
    try {
      return await _auth.currentUser!.sendEmailVerification();
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

  // Sign In with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
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

  // Forgot Password
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
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

  // Delete Account
  Future<void> deletAccount() async {
    try {
      await UserRepository.instance
          .removeUserData(userID: _auth.currentUser!.uid);
      await _auth.currentUser!.delete();
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

  //Re authentication email and password
  Future<void> reAuthenticateEmailAndPasswordUser(
      {required String email, required String password}) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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

  // Sign Out
  signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Get.offAndToNamed(AppRoute.loginViewPath);
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
