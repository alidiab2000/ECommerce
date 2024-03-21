import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/products/product_card/product_card_horizontal.dart';
import '../../../../../core/utils/common/widgets/text/section_heading.dart';
import '../../../../../core/utils/constants/sizes.dart';

class CatergoriesSections extends StatelessWidget {
  const CatergoriesSections({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          title: title,
          showActionButton: true,
          onPressed: () {},
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => const ProductCardHorizontal(),
            separatorBuilder: (_, __) => const SizedBox(
              width: CustomSizes.spaceBtwItems,
            ),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
