import 'package:e_commerce/Feature/shop/views/home/widgets/text_widgets/section_heading.dart';
import 'package:flutter/material.dart';
 
import '../../../../../core/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          showActionButton: true,
          onPressed: () {},
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        Text(
          "Ali diab",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Text(
              "+201123456789",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Expanded(
              child: Text(
                "Egypt, Giza, Inside the ring road, 15",
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
