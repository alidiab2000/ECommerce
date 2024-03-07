import '../../../../../core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../home/widgets/text_widgets/offer_text.dart';
import '../../home/widgets/text_widgets/product_price.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const OfferText(offer: '25'),
        const SizedBox(
          width: CustomSizes.spaceBtwItems,
        ),
        Text(
          "\$200",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(decoration: TextDecoration.lineThrough),
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwItems,
        ),
        const Productprice(
          price: '150',
          isLagre: true,
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwItems * 1.5,
        ),
      ],
    );
  }
}
