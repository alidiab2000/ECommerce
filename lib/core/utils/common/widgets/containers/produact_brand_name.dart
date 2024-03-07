import '../../../constants/colors.dart';
import '../../../constants/enums.dart';
import '../../../helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/sizes.dart';

class ProductBarndNameAndVerfiedIcon extends StatelessWidget {
  const ProductBarndNameAndVerfiedIcon({
    super.key,
    required this.brandName,
    this.maxLines = 1,
    required this.brandTextSize,
  });
  final String brandName;
  final int maxLines;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).textTheme;
    final color =
        HelperFunctions.isDarkMode(context) ? AppColors.white : AppColors.black;
    return Row(
      children: [
        Text(
          brandName,
          style: brandTextSize == TextSizes.small
              ? th.labelMedium!.apply(color: color)
              : brandTextSize == TextSizes.medium
                  ? th.bodyLarge!.apply(color: color)
                  : brandTextSize == TextSizes.large
                      ? th.titleLarge!.apply(color: color)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: color),
          maxLines: 1,
        ),
        const SizedBox(
          width: CustomSizes.sm,
        ),
        const Icon(
          Iconsax.verify5,
          color: AppColors.primary,
          size: CustomSizes.iconXs,
        )
      ],
    );
  }
}
