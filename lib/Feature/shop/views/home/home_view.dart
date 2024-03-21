import '../../../../core/utils/common/widgets/products/product_card/product_card_vertiacl.dart';
import '../../../../core/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/common/layouts/grid_view.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'widgets/header_section.dart';
import 'widgets/promo_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const PromoSlider(
                    banners: [
                      AppImages.promoBanner1,
                      AppImages.promoBanner2,
                      AppImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  GridLayout(
                    itemCount: 20,
                    crossAxisCount: 2,
                    itemBuilder: (context, index) =>
                        const ProductCardVertiacl(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
