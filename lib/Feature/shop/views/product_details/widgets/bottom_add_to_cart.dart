import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:e_commerce/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/common/widgets/icons/circular_icon.dart';
import '../../../../../core/utils/constants/colors.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CustomSizes.defaultSpace,
        vertical: CustomSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.darkerGrey : AppColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.cardRadiusLg),
          topRight: Radius.circular(CustomSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                backgroundColor: AppColors.darkGrey,
                width: 40,
                height: 40,
                icon: Iconsax.minus,
                iconColor: AppColors.white,
              ),
              const SizedBox(
                width: CustomSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: CustomSizes.spaceBtwItems,
              ),
              const CircularIcon(
                backgroundColor: AppColors.black,
                width: 40,
                height: 40,
                icon: Iconsax.add,
                iconColor: AppColors.white,
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(
                  CustomSizes.sm,
                ),
                backgroundColor: AppColors.black,
                side: BorderSide.none,
              ),
              child: const Text("Add To Cart"),
            ),
          )
        ],
      ),
    );
  }
}
