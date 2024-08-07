import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/data/repositories/auth/auth_repo.dart';
import 'package:get/get.dart';

import '../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../core/utils/common/widgets/list_tile/setting_menu_list_tile.dart';
import '../../../../core/utils/common/widgets/list_tile/setting_menu_tile.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/common/widgets/containers/curve_edge.dart';
import '../../../../core/utils/common/widgets/text/section_heading.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCurveEdgeContainer(
              child: Column(
                children: [
                  CustomAppBar(
                    showBackArrow: false,
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const UserProfileTile(),
                  const SizedBox(
                    height: CustomSizes.defaultSpace,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    title: "Account Setting",
                  ),
                  const SizedBox(
                    height: CustomSizes.defaultSpace,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Set shopping delivery address",
                    onTap: () => Get.toNamed(AppRoute.addressViewPath),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    onTap: () => Get.toNamed(AppRoute.cartviewPath),
                    subtitle: "Add , Rempve product and move to checkout",
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Order",
                    onTap: () => Get.toNamed(AppRoute.orderViewPath),
                    subtitle: "In-progress and Completed Orders",
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Acount",
                    subtitle: "Withdraw balance to registered bank acount",
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subtitle: "List oof all the discount coupons",
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.notification,
                    title: "Notification",
                    subtitle: "Set andy kind of notification ,essage",
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.security_card,
                    title: "Acount Privacy",
                    subtitle: "Manage data usage and connected accounts",
                  ),
                  //=============
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  const SectionHeading(title: "App Setting"),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: 'Upload data to your cloud firebase',
                    onTap: () => Get.toNamed(AppRoute.loaddataPath),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subtitle: 'Set recommendation base on location',
                    trailing: Switch(value: false, onChanged: (val) {}),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subtitle: 'Search resultis safe for all ages',
                    trailing: Switch(value: false, onChanged: (val) {}),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality ",
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                  const SizedBox(height: CustomSizes.defaultSpace),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: AuthenticationRepository.instance.signOut,
                      child: const Text("Logout"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
