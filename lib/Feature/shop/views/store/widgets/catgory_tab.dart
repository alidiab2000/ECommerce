import 'package:e_commerce/core/utils/common/layouts/grid_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../home/widgets/product_card_vertiacl.dart';
import '../../home/widgets/text_widgets/section_heading.dart';
import 'brand_show_case.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CustomSizes.spaceBtwItems),
          child: Column(
            children: [
              const BrandShowCase(
                images: [
                  AppImages.productImage1,
                  AppImages.productImage2,
                  AppImages.productImage3,
                ],
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              const BrandShowCase(
                images: [
                  AppImages.productImage1,
                  AppImages.productImage2,
                  AppImages.productImage3,
                ],
              ),
              SectionHeading(
                title: 'You may like',
                showActionButton: true,
                color: HelperFunctions.isDarkMode(context)
                    ? AppColors.white
                    : AppColors.black,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              GridLayout(
                itemBuilder: (_, index) => const ProductCardVertiacl(),
                crossAxisCount: 2,
                itemCount: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
