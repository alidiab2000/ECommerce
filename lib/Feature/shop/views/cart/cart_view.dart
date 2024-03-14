import 'package:e_commerce/Feature/shop/views/home/widgets/text_widgets/product_price.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/cart_item.dart';
import 'widgets/product_qantity_with_add_and_remove_buttons.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: CustomSizes.defaultSpace,
          ),
          itemCount: 10,
          itemBuilder: (_, index) => const Column(
            children: [
              CartItem(),
              SizedBox(
                height: CustomSizes.spaceBtwItems,
              ),
              Row(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(
          child: const Text("Checkout"),
          onPressed: () {},
        ),
      ),
    );
  }
}
