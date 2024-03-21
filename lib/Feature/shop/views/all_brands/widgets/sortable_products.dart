
import 'package:flutter/material.dart';

import '../../../../../core/utils/common/layouts/grid_view.dart';
import '../../../../../core/utils/common/widgets/containers/brand_card.dart';
import '../../../../../core/utils/common/widgets/text/section_heading.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeading(title: "Brands"),
        const SizedBox(height: CustomSizes.spaceBtwSections),
        GridLayout(
          itemBuilder: (_, index) => const BrandCard(
            brandName: "Nike",
            brandImage: AppImages.nikeLogo,
            brandDescripstion: "256 Product",
          ),
          mainAxisExtent: 60,
          crossAxisCount: 2,
          itemCount: 8,
        )
      ],
    );
  }
}
