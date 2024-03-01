import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/containers/circular_image_comtainer.dart';
import '../../../../../core/utils/common/widgets/containers/produact_brand_name.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/enums.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    this.onTap,
    required this.brandName,
    required this.brandDescripstion,
    required this.brandImage,
    this.showBorder = true,
  });
  final void Function()? onTap;
  final String brandName;
  final String brandImage;
  final String brandDescripstion;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(CustomSizes.sm),
        decoration: BoxDecoration(
          border: showBorder ? Border.all(color: AppColors.white) : null,
          borderRadius: BorderRadius.circular(CustomSizes.defaultSpace),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image Of Brand
            const CircularImageContainer(
              image: AppImages.clothIcon,
            ),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductBarndNameAndVerfiedIcon(
                    brandName: brandName,
                    brandTextSize: TextSizes.medium,
                  ),
                  Text(
                    brandDescripstion,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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
