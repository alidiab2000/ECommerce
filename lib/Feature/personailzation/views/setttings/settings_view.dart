import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/common/widgets/list_tile/setting_menu_list_tile.dart';
import 'package:e_commerce/core/utils/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/common/widgets/containers/curve_edge.dart';
import '../../../shop/views/home/widgets/text_widgets/section_heading.dart';

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
                  const SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Add , Rempve product and move to checkout",
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Address",
                    subtitle: "Add , Rempve product and move to checkout",
                  ),
                  const SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Order",
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
                  const SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: 'Upload data to your cloud firebase',
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
