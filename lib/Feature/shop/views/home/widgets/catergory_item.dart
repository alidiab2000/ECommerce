import 'package:e_commerce/core/utils/common/widgets/containers/circular_image_comtainer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.catergoryName,
    this.isNetworkImage = true,
    required this.onTap,
  });
  final String image;
  final bool isNetworkImage;
  final String catergoryName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          children: [
            Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: dark ? AppColors.white : AppColors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircularImageContainer(
                  image: image,
                  isNetworkImage: isNetworkImage,
                  fit: BoxFit.fitWidth,
                  color: dark ? AppColors.black : AppColors.white,
                  padding: 0,
                )),
            const SizedBox(
              height: CustomSizes.spaceBtwItems / 2,
            ),
            Text(
              catergoryName,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
