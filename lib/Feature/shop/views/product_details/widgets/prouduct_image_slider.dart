import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../../core/utils/common/widgets/containers/curve_edge.dart';
import '../../../../../core/utils/common/widgets/icons/favourtes_icons.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../home/widgets/rounded_image.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return HeaderCurveEdgeContainer(
      child: Container(
        color: darkMode ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: Image.asset(
                  AppImages.productImage1,
                ),
              ),
            ),
            CustomAppBar(
              showBackArrow: true,
              actions: [
                FavourtesIcon(
                  onPressed: () {},
                )
              ],
            ),
            Positioned(
              bottom: 40,
              left: 40,
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (_, index) => RoundedImage(
                    width: 60,
                    border: Border.all(color: AppColors.primary),
                    image: AppImages.productImage3,
                  ),
                  separatorBuilder: (_, index) => const SizedBox(
                    width: CustomSizes.spaceBtwItems,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
