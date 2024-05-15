import 'package:e_commerce/Feature/shop/models/category_model/category_model.dart';
import 'package:e_commerce/core/utils/popups/loaders.dart';
import 'package:e_commerce/data/repositories/categoryies/categories_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../../core/utils/exceptions/firebase_exceptions.dart';
import '../../../../core/utils/exceptions/platform_exceptions.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();
  final CategoriesRepo _categoriesRepo = Get.put(CategoriesRepo());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      // Fetch Categories from firestore
      final categories = await _categoriesRepo.getAllCategories();
      // Assign (Update) Categories
      allCategories.assignAll(categories);
      // Get Featured Categories
      featuredCategories.assignAll(allCategories
          .where(
            (category) => category.isFeatured && category.parentId.isEmpty,
          )
          .take(8)
          .toList());
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
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
