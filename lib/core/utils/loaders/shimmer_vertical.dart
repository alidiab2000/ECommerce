import 'package:e_commerce/core/utils/common/layouts/grid_view.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:e_commerce/core/utils/loaders/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerVertical extends StatelessWidget {
  final int itemCount;

  const ShimmerVertical({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerEffect(width: 180, height: 250),
            SizedBox(height: CustomSizes.spaceBtwItems),
            ShimmerEffect(width: 180, height: 10),
            SizedBox(height: CustomSizes.spaceBtwItems / 2),
            ShimmerEffect(width: 180, height: 10),
          ],
        ),
      ),
      crossAxisCount: 2,
      itemCount: itemCount,
    );
  }
}
