import 'package:e_commerce/core/utils/common/widgets/products/cart/cart_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/products/cart/product_qantity_with_add_and_remove_buttons.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../home/widgets/text_widgets/product_price.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: CustomSizes.defaultSpace,
      ),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          const CartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: CustomSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: ProductQantityWIthRemoveAndAddButtons(),
                ),
                Productprice(price: '265')
              ],
            )
        ],
      ),
    );
  }
}
