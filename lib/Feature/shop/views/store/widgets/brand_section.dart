import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/appbar/tabar.dart';
import '../../../../../core/utils/common/widgets/containers/search_text_field.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../home/widgets/text_widgets/section_heading.dart';
import 'store_grid_layout.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

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
              color: darkMode ? AppColors.white : AppColors.black,
            ),
            const StoreGridLayOut()
          ],
        ),
      ),
      bottom: const CustomTabBar(
        tabs: [
          Tab(child: Text('Sports')),
          Tab(child: Text('Furniture')),
          Tab(child: Text('Electronics')),
          Tab(child: Text('Clothes')),
          Tab(child: Text('Shoses')),
        ],
      ),
    );
  }
}
