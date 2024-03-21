import 'package:e_commerce/core/utils/common/layouts/grid_view.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/common/widgets/products/product_card/product_card_vertiacl.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Popular Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.sort),
                ),
                onChanged: (value) {
                  debugPrint(value);
                },
                items: ['Name', "Low Price", "High Price", "Sale"]
                    .map(
                      (option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              GridLayout(
                itemBuilder: (_, index) => const ProductCardVertiacl(),
                crossAxisCount: 2,
                itemCount: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
