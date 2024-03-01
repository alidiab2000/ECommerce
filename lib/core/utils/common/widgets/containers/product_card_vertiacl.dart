import 'package:e_commerce/core/utils/constants/enums.dart';
import 'package:flutter/widgets.dart';

import '../../../../../Feature/shop/views/home/widgets/icons/favourtes_icons.dart';
import '../../../../../Feature/shop/views/home/widgets/icons/product_add_icon.dart';
import '../../../../../Feature/shop/views/home/widgets/rounded_image.dart';
import '../../../../../Feature/shop/views/home/widgets/text_widgets/offer_text.dart';
import '../../../../../Feature/shop/views/home/widgets/text_widgets/product_price.dart';
import '../../../../../Feature/shop/views/home/widgets/text_widgets/product_title.dart';

import '../../../../../core/utils/common/styles/shadow_style.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/common/widgets/containers/produact_brand_name.dart';

class ProductCardVertiacl extends StatelessWidget {
  const ProductCardVertiacl({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            CustomShadowStyle.productShadow,
          ],
          color: darkMode ? AppColors.darkerGrey : AppColors.white,
          borderRadius: BorderRadius.circular(
            CustomSizes.productImageRadius,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 160,
              padding: const EdgeInsets.all(CustomSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  CustomSizes.productImageRadius,
                ),
                color: darkMode ? AppColors.dark : AppColors.light,
              ),
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: CustomSizes.sm),
                    child: RoundedImage(
                      image: AppImages.productImage1,
                    ),
                  ),
                  // Offer
                  const Positioned(
                    top: 10,
                    child: OfferText(offer: "20"),
                  )
                  //Fav Icon
                  ,
                  Positioned(
                    right: 0,
                    top: 0,
                    child: FavourtesIcon(
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: CustomSizes.defaultSpace / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitle(
                    title: 'Green Nick Air Shoes',
                    smallsize: true,
                  ),
                  Row(
                    children: const [
                      ProductBarndNameAndVerfiedIcon(
                        brandName: 'Nick',
                        brandTextSize: TextSizes.small,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Productprice(price: '35.0'),
                ProductAddIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}