import 'package:e_commerce/data/repositories/banners/banner_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../../core/utils/exceptions/firebase_exceptions.dart';
import '../../../../core/utils/exceptions/platform_exceptions.dart';
import '../../../../core/utils/popups/loaders.dart';
import '../../../../data/dummy_data/dummy_data.dart';
import '../../models/banner_model/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  final bannerLoading = false.obs;
  final banners = <BannerModel>[].obs;
  final _bannerRepo = Get.put(BannerRepo());
  final caruselSliderCurrnetIndex = 0.obs;
  void updatePageIndecator(index) => caruselSliderCurrnetIndex.value = index;
  @override
  void onInit() async {
    await fetchBanner();
    super.onInit();
  }

  Future<void> fetchBanner() async {
    try {
      bannerLoading.value = true;

      final banners = await _bannerRepo.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);
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
      bannerLoading.value = false;
    }
  }

  Future<void> uploadDummyData() async {
    try {
      // Perform upload here
      final bannerDummyData = DummyData.banners;
      await _bannerRepo.uploadDummyData(bannerDummyData);
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
