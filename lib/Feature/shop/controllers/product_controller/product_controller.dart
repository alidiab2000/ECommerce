import 'package:e_commerce/Feature/shop/models/product_model/product_model.dart';
import 'package:e_commerce/core/utils/popups/loaders.dart';
import 'package:e_commerce/data/repositories/product/product_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../../core/utils/exceptions/firebase_exceptions.dart';
import '../../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../../data/dummy_data/dummy_data.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final featuredProducts = <ProductModel>[].obs;
  final productRepo = Get.put(ProductRepo());
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  String getStockStatus(ProductModel product) {
    if (product.stock == 0) {
      return "Out of Stock";
    } else {
      return "In Stock";
    }
  }

  String getProductPrice(ProductModel product) {
    var smallestPrice = double.infinity;
    var largestPrice = 0.0;
    if (product.productType == ProductType.singel.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      return " $smallestPrice -$largestPrice";
    }
  }

  String? calculateSalesPercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) {
      return null;
    }
    if (originalPrice <= 0) {
      return null;
    }
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepo.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadDummyData() async {
    try {
      // Perform upload here
      final productDummy = DummyData.products;
      await productRepo.uploadDummyData(productDummy);
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
    }
  }
}
