import 'package:e_commerce/Feature/shop/views/home/widgets/rounded_image.dart';
import 'package:flutter/material.dart';

import '../../containers/produact_brand_name.dart';
import '../../../../constants/enums.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../../../Feature/shop/views/home/widgets/text_widgets/product_title.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const RoundedImage(
              image: AppImages.productImage1,
              width: 70,
              height: 70,
            ),
            const SizedBox(
              width: CustomSizes.spaceBtwItems,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductBarndNameAndVerfiedIcon(
                    brandName: "Nike", brandTextSize: TextSizes.small),
                const ProductTitle(title: "Black Sports Shose"),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Color ",
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: "Green",
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: " Size ",
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: "42",
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
