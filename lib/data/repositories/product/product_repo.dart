import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/Feature/shop/controllers/firebase_storage_services/firebase_storage_services.dart';
import 'package:e_commerce/Feature/shop/models/product_model/product_model.dart';
import 'package:e_commerce/core/utils/constants/enums.dart';
import 'package:e_commerce/core/utils/popups/loaders.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Future<List<ProductModel>> getFeaturedProducts() async {
    final snapshot = await _db
        .collection("Products")
        .where(
          "IsFeatured",
          isEqualTo: true,
        )
        .limit(4)
        .get();
    return snapshot.docs.map((e) => ProductModel.formSnapshot(e)).toList();
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(FirebaseStorageServices());

      for (var product in products) {
        final thumbnail =
            await storage.getImageFromAssets(path: product.thumbnail);
        final url = await storage.uploadImageData(
            path: 'Products/Image',
            image: thumbnail,
            name: product.thumbnail.toString());

        product.thumbnail = url;
        //Product List of images
        List<String> imageUrl = [];
        if (product.images != null && product.images!.isNotEmpty) {
          for (var image in product.images!) {
            final assetsImage = await storage.getImageFromAssets(path: image);
            final url = await storage.uploadImageData(
                path: 'Products/Image',
                image: assetsImage,
                name: image.toString());
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetsImage =
                await storage.getImageFromAssets(path: variation.image);
            final url = await storage.uploadImageData(
                path: 'Products/Image',
                image: assetsImage,
                name: variation.image.toString());
            variation.image = url;
          }
        }

        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } catch (e) {
      debugPrint(e.toString());
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
