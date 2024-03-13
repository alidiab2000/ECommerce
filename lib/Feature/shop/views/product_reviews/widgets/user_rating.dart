import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import 'custom_rating_indicator.dart';

class UserRating extends StatelessWidget {
  const UserRating({
    super.key,
    required this.rating,
    required this.dataOfPosting,
  });

  final double rating;
  final String dataOfPosting;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRatingBarIndicator(rating: rating),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Text(
          dataOfPosting,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
