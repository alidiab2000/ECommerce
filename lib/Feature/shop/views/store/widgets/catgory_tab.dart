import 'package:e_commerce/Feature/shop/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/common/widgets/text/section_heading.dart';
import '../../../controllers/product_controller/product_controller.dart';
import 'brand_show_case.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return ListView(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: const [
        Padding(
          padding: EdgeInsets.all(CustomSizes.spaceBtwItems),
          child: Column(
            children: [
              BrandShowCase(
                images: [
                  AppImages.productImage1,
                  AppImages.productImage2,
                  AppImages.productImage3,
                ],
              ),
              SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              BrandShowCase(
                images: [
                  AppImages.productImage1,
                  AppImages.productImage2,
                  AppImages.productImage3,
                ],
              ),
              SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              SectionHeading(
                title: 'You may like',
                showActionButton: true,
              ),
              SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
