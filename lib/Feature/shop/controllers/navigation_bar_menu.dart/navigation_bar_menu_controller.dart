import 'package:e_commerce/Feature/shop/views/store/store_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/home/home_view.dart';

class NavigationMenuController extends GetxController {
  final selectedIndex = 0.obs;
  void chanageselectedIndex(int index) => selectedIndex.value = index;
  //TODO : Add all screens you'll create
  final screens = [
    const HomeView(),
    const StoreView(),
    Container(
      color: Colors.deepOrange,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];
}
