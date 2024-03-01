import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/sizes.dart';

class ProductAddIcon extends StatelessWidget {
  const ProductAddIcon({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        decoration: const BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              CustomSizes.productImageRadius,
            ),
            bottomRight: Radius.circular(
              CustomSizes.productImageRadius,
            ),
          ),
        ),
        child: const SizedBox(
          width: CustomSizes.iconLg * 1.2,
          height: CustomSizes.iconLg * 1.2,
          child: Center(
            child: Icon(Iconsax.add),
          ),
        ),
      ),
    );
  }
}
