import 'package:get/get.dart';

class HomeViewController extends GetxController {
  static HomeViewController instance = Get.find();
  final caruselSliderCurrnetIndex = 0.obs;
  void updatePageIndecator(index) => caruselSliderCurrnetIndex.value = index;
}
