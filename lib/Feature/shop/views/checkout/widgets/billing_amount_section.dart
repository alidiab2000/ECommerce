import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$213.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),

        ///Shpping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shopping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),

        ///Total Order
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Order", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$60.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
      ],
    );
  }
}
