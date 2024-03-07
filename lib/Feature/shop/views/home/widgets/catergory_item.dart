import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.catergoryName,
    required this.onTap,
  });
  final String image;
  final String catergoryName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          children: [
            Container(
              width: 55,
              height: 55,
              padding: const EdgeInsets.all(CustomSizes.sm),
              decoration: BoxDecoration(
                color: dark ? AppColors.white : AppColors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
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
