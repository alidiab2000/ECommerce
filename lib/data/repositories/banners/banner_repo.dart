import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Feature/shop/controllers/firebase_storage_services/firebase_storage_services.dart';
import '../../../Feature/shop/models/banner_model/banner_model.dart';
import '../../../core/utils/exceptions/firebase_exceptions.dart';
import '../../../core/utils/exceptions/platform_exceptions.dart';

class BannerRepo extends GetxController {
  static BannerRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _db.collection("Banners").get();
      debugPrint("Snapshot : ${snapshot.docs}");
      final listBanners = snapshot.docs
          .map(
            (banner) => BannerModel.fromSnapshot(banner),
          )
          .toList();
      return listBanners;
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

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Perform upload here
      final storage = Get.put(FirebaseStorageServices());
      for (var banner in banners) {
        //Get Image link from local assets
        final imageData =
            await storage.getImageFromAssets(path: banner.imageURL);
        // Upload image and get it link
        final imageLink = await storage.uploadImageData(
          path: "Banners",
          image: imageData,
          name: banner.imageURL,
        );

        //Assign URL to category.image attribute
        banner.imageURL = imageLink;

        // Upload category to firestore
        await _db.collection("Banners").doc().set(banner.toJson());
      }
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }
}
