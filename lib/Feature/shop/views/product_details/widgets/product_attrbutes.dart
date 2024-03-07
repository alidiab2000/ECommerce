import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/chips/cusotm_choice_chip.dart';
import '../../../../../core/utils/common/widgets/containers/round_container.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../home/widgets/text_widgets/product_price.dart';
import '../../home/widgets/text_widgets/section_heading.dart';
import 'product_title_text.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
  });

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
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const Productprice(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Stock : ', samllSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const ProductTitleText(
                title:
                    "This is Description of product and it can up to max 4 lines",
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
                    text: '29', selected: false, onSelected: (value) {}),
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
