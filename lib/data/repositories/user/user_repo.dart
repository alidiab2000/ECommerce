import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Feature/auth/models/user_model.dart';
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
}
