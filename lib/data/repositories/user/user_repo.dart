import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Feature/auth/models/user_model.dart';
import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/utils/exceptions/firebase_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  // Database
  final _db = FirebaseFirestore.instance;

  // Function To Add User Data
  Future<void> saveUserData({required UserModel user}) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , plz try again later";
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentationSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
      if (documentationSnapshot.exists) {
        return UserModel.fromSnapShot(documentationSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , plz try again later";
    }
  }

  Future<void> updateUserDetails({required UserModel updateUser}) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , plz try again later";
    }
  }

  Future<void> updateSingleField({required Map<String, dynamic> json}) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , plz try again later";
    }
  }

  Future<void> removeUserData({required String userID}) async {
    try {
      await _db.collection("Users").doc(userID).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , plz try again later";
    }
  }
}
