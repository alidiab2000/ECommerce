import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/tabbar/tabbar.dart';
import '../../../../../core/utils/common/textfields/search_text_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/common/widgets/text/section_heading.dart';
import 'store_grid_layout.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          children: const [
            SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            SearchTextField(),
            SizedBox(
              height: CustomSizes.spaceBtwItems / 1.5,
            ),
            SectionHeading(
              title: 'Feature bbrands',
              showActionButton: true,
            ),
            StoreGridLayOut()
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
