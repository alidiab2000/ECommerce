import 'package:e_commerce/core/utils/constants/colors.dart';

import 'package:e_commerce/core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppTexts.popularProducts,
          style: Theme.of(context).textTheme.headlineMedium!.apply(
                color: AppColors.black,
              ),
        ),
      ],
    );
  }
}
