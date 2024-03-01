import 'package:e_commerce/Feature/personailzation/views/setttings/settings_view.dart';
import 'package:e_commerce/Feature/shop/views/store/store_view.dart';
import 'package:e_commerce/Feature/shop/views/wishlist/wishlist_view.dart';
import 'package:get/get.dart';

import '../../views/home/home_view.dart';

class NavigationMenuController extends GetxController {
  final selectedIndex = 0.obs;
  void chanageselectedIndex(int index) => selectedIndex.value = index;
  //TODO : Add all screens you'll Create
  final screens = [
    const HomeView(),
    const StoreView(),
    const WishListView(),
    const SettingsView(),
  ];
}
