// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/Feature/shop/controllers/product_controller/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/Feature/shop/models/product_model/product_model.dart';

import '../../../../../core/utils/common/widgets/chips/cusotm_choice_chip.dart';
import '../../../../../core/utils/common/widgets/containers/round_container.dart';
import '../../../../../core/utils/common/widgets/text/product_price.dart';
import '../../../../../core/utils/common/widgets/text/section_heading.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'product_title_text.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(CustomSizes.md),
          showBorder: false,
          backgroundColor: AppColors.grey.withOpacity(0.6),
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(title: "Variation"),
                  const SizedBox(width: CustomSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Price : ', samllSize: true),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          Productprice(price: product.salePrice.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Stock : ', samllSize: true),
                          Text(
                            ProductController.instance.getStockStatus(product),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              ProductTitleText(
                title: product.description!,
                samllSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        Column(
          children: [
            const SizedBox(height: CustomSizes.spaceBtwSections),
            const SectionHeading(title: "Color"),
            Wrap(
              spacing: 10,
              children: [
                CustomChoiceChip(
                    text: 'Green', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'Red', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          children: [
            const SectionHeading(title: "Size"),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                CustomChoiceChip(
                    text: '28', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    text: '29', selected: true, onSelected: (value) {}),
                CustomChoiceChip(
                    text: '30', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: '32', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: '33', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: '34', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: '35', selected: false, onSelected: (value) {}),
                CustomChoiceChip(
                    text: '36', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
