import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Feature/shop/controllers/firebase_storage_services/firebase_storage_services.dart';
import 'package:e_commerce/Feature/shop/models/category_model/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../core/utils/exceptions/firebase_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';

class CategoriesRepo extends GetxController {
  static CategoriesRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final listCatergories = snapshot.docs
          .map(
            (category) => CategoryModel.fromJson(category),
          )
          .toList();
      return listCatergories;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Perform upload here
      final storage = Get.put(FirebaseStorageServices());
      for (var category in categories) {
        //Get Image link from local assets
        final imageData =
            await storage.getImageFromAssets(path: category.image);
        // Upload image and get it link
        final imageLink = await storage.uploadImageData(
          path: "Categories",
          image: imageData,
          name: category.image,
        );

        //Assign URL to category.image attribute
        category.image = imageLink;

        // Upload category to firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }
}
