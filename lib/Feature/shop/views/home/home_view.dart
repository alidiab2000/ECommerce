import 'package:e_commerce/Feature/shop/controllers/product_controller/product_controller.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/common/widgets/text/section_heading.dart';
import 'package:e_commerce/core/utils/loaders/shimmer_vertical.dart';
import 'package:get/get.dart';

import '../../../../core/utils/common/widgets/products/product_card/product_card_vertiacl.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/common/layouts/grid_view.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'widgets/header_section.dart';
import 'widgets/promo_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header - AppBar - search bar
            const HeaderSection(),
            //Body of Home Screen
            Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  SectionHeading(
                    title: "Popular Products",
                    showActionButton: true,
                    onPressed: () => Get.toNamed(AppRoute.allProductsViewPath),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return ShimmerVertical(
                        itemCount: controller.featuredProducts.length,
                      );
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Text(
                        "No products found",
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    }

                    return GridLayout(
                      itemCount: controller.featuredProducts.length,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) => ProductCardVertiacl(
                        product: controller.featuredProducts[index],
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
