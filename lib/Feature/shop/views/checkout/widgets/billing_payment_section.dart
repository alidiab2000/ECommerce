import 'package:e_commerce/core/utils/common/widgets/text/section_heading.dart';
import 'package:e_commerce/core/utils/common/widgets/containers/round_container.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return Column(
      children: [
        SectionHeading(
          showActionButton: true,
          title: "Payment Method",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: darkMode ? AppColors.light : AppColors.white,
              padding: const EdgeInsets.all(CustomSizes.sm),
              showBorder: false,
              child: Image.asset(
                AppImages.paypal,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems / 2),
            Text(
              "Paypal",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}
