import '../../../personailzation/views/setttings/settings_view.dart';
import '../../views/store/store_view.dart';
import '../../views/wishlist/wishlist_view.dart';
import 'package:get/get.dart';

import '../../views/home/home_view.dart';

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();
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
