import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/utils/common/widgets/icons/circular_icon.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class ProductQantityWIthRemoveAndAddButtons extends StatelessWidget {
  const ProductQantityWIthRemoveAndAddButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircularIcon(
          backgroundColor: AppColors.darkGrey,
          width: 30,
          height: 30,
          size: CustomSizes.md,
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
          backgroundColor: AppColors.primary,
          width: 30,
          height: 30,
          size: CustomSizes.md,
          icon: Iconsax.add,
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
