import 'package:e_commerce/Feature/shop/controllers/navigation_bar_menu.dart/navigation_bar_menu_controller.dart';
import '../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () =>
                NavigationMenuController.instance.selectedIndex.value = 0,
            icon: const Icon(Iconsax.add),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              //   GridLayout(
              //       itemBuilder: (_, index) => const ProductCardVertiacl(),
              //       crossAxisCount: 2,
              //       itemCount: 5)
            ],
          ),
        ),
      ),
    );
  }
}
