import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/common/routes/app_router.dart';
import '../../../../../core/utils/common/widgets/tab_bar/tabbar.dart';
import '../../../../../core/utils/common/textfields/search_text_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/common/widgets/text/section_heading.dart';
import '../../../controllers/categories_controller/categories_controller.dart';
import 'store_grid_layout.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesController.instance.featuredCategories;

    return SliverAppBar(
      expandedHeight: 400,
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(
          CustomSizes.defaultSpace,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            const SearchTextField(),
            const SizedBox(
              height: CustomSizes.spaceBtwItems / 1.5,
            ),
            SectionHeading(
              title: 'Feature bbrands',
              showActionButton: true,
              onPressed: () => Get.toNamed(AppRoute.allBrnadsViewPath),
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            const StoreGridLayOut()
          ],
        ),
      ),
      bottom: CustomTabBar(
        tabs: categories
            .map(
              (category) => Tab(child: Text(category.name)),
            )
            .toList(),
      ),
    );
  }
}
