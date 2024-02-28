import 'icons/favourtes_icons.dart';
import 'rounded_image.dart';
import '../../../../../core/utils/common/styles/shadow_style.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'icons/product_add_icon.dart';
import 'text_widgets/offer_text.dart';
import 'text_widgets/produact_brand_name.dart';
import 'text_widgets/product_price.dart';
import 'text_widgets/product_title.dart';

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
          color: darkMode ? AppColors.darkGrey : AppColors.white,
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
                color: darkMode ? AppColors.dark : AppColors.light,
              ),
              child: Stack(
                children: [
                  const RoundedImage(
                    image: AppImages.productImage1,
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
            const Padding(
              padding: EdgeInsets.only(left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(
                    title: 'Green Nick Air Shoes',
                    smallsize: true,
                  ),
                  Row(
                    children: [
                      ProductBarndName(
                        brandName: 'Nick',
                      ),
                      SizedBox(
                        width: CustomSizes.sm,
                      ),
                      Icon(
                        Iconsax.verify5,
                        color: AppColors.primary,
                        size: CustomSizes.iconXs,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Productprice(price: '35.0'),
                      ProductAddIcon(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
