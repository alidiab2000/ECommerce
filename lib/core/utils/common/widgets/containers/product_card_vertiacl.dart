import 'package:e_commerce/core/utils/common/widgets/text/offer_text.dart';
import 'package:flutter/cupertino.dart';
import '../../../constants/enums.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../icons/favourtes_icons.dart';
import '../icons/product_add_icon.dart';
import '../../../../../Feature/shop/views/home/widgets/rounded_image.dart';
import '../text/product_price.dart';
import '../text/product_title.dart';
import '../../../../../core/utils/common/styles/shadow_style.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/common/widgets/containers/produact_brand_name.dart';
import '../../routes/app_router.dart';

class ProductCardVertiacl extends StatelessWidget {
  const ProductCardVertiacl({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.productDetailViewPath),
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
              width: double.infinity,
              padding: const EdgeInsets.all(CustomSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  CustomSizes.productImageRadius,
                ),
                color: darkMode ? AppColors.dark : AppColors.light,
              ),
              child: Stack(
                children: [
                  const Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.only(top: CustomSizes.sm),
                      child: RoundedImage(
                        image: AppImages.productImage1,
                      ),
                    ),
                  ),
                  // Offer
                  const Positioned(top: 10, child: OfferText(offer: "20"))
                  //Fav Icon
                  ,
                  Positioned(
                    right: 0,
                    top: 0,
                    child: FavourtesIcon(onPressed: () {}),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
