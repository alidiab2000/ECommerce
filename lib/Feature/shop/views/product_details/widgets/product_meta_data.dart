// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/Feature/shop/controllers/product_controller/product_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/text/offer_text.dart';
import '../../../../../core/utils/common/widgets/text/product_price.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../models/product_model/product_model.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Row(
      children: [
        OfferText(
            offer: controller.calculateSalesPercentage(
                product.price, product.salePrice)!),
        const SizedBox(
          width: CustomSizes.spaceBtwItems,
        ),
        Text(
          "\$${product.price}",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(decoration: TextDecoration.lineThrough),
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwItems,
        ),
        Productprice(
          price: product.salePrice.toString(),
          isLagre: true,
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwItems * 1.5,
        ),
      ],
    );
  }
}
