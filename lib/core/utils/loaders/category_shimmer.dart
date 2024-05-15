import 'package:e_commerce/core/utils/loaders/shimmer.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Column(
          children: [
            ShimmerEffect(
              width: 55,
              height: 55,
              raduis: 55,
            ),
            SizedBox(
              height: CustomSizes.spaceBtwItems / 2,
            ),
            ShimmerEffect(
              width: 55,
              height: 8,
              raduis: 55,
            )
          ],
        ),
        separatorBuilder: (_, __) => const SizedBox(
          width: CustomSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
      ),
    );
  }
}
