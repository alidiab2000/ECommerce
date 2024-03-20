import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class OfferText extends StatelessWidget {
  const OfferText({
    super.key,
    required this.offer,
  });
  final String offer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: CustomSizes.xs,
        horizontal: CustomSizes.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        '$offer%',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge!.apply(
              color: AppColors.black,
            ),
      ),
    );
  }
}
