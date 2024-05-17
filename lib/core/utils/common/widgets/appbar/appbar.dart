import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/sizes.dart';
import '../../../device/device_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    required this.showBackArrow,
    this.leadingOnPressed,
    this.backArrowOnPressed,
  });
  final Widget? title;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final bool showBackArrow;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? backArrowOnPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CustomSizes.md,
      ),
      child: AppBar(
        title: title,
        actions: actions,
        automaticallyImplyLeading: false,
        leading: backArrowOnPressed != null
            ? _backArrowOnPressed()
            : _showBackArrow(),
      ),
    );
  }

  Widget? _showBackArrow() {
    return showBackArrow
        ? IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Iconsax.arrow_left),
          )
        : leadingIcon != null
            ? IconButton(
                onPressed: leadingOnPressed,
                icon: Icon(leadingIcon),
              )
            : null;
  }

  Widget _backArrowOnPressed() {
    return IconButton(
      onPressed: backArrowOnPressed,
      icon: const Icon(Iconsax.arrow_left),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight);
}
