import 'package:e_commerce/Feature/shop/models/category_model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/common/layouts/grid_view.dart';
import '../../../../../core/utils/common/widgets/products/product_card/product_card_vertiacl.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/common/widgets/text/section_heading.dart';
import 'brand_show_case.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
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
              const SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              const SectionHeading(
                title: 'You may like',
                showActionButton: true,
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
