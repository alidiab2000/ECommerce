import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/containers/round_container.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(CustomSizes.sm),
      borderColor: AppColors.grey,
      child: Column(
        children: [
          const BrandCard(
            brandName: 'Nick',
            brandDescripstion: '213 Product',
            brandImage: AppImages.clothIcon,
            showBorder: false,
          ),
          Row(
            children: images
                .map(
                  (image) => brandTopProductImageWidget(context, image),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(BuildContext context, String image) {
    return Expanded(
      child: RoundedContainer(
        backgroundColor: HelperFunctions.isDarkMode(context)
            ? AppColors.darkerGrey
            : AppColors.white,
        height: 100,
        showBorder: false,
        margin: const EdgeInsets.only(
          right: CustomSizes.sm,
        ),
        padding: const EdgeInsets.all(CustomSizes.md),
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
