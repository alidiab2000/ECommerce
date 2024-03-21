import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/common/widgets/containers/round_container.dart';
import 'package:e_commerce/core/utils/common/widgets/icons/favourtes_icons.dart';
import 'package:e_commerce/core/utils/common/widgets/text/offer_text.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../Feature/shop/views/home/widgets/rounded_image.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/enums.dart';
import '../../../../constants/sizes.dart';
import '../../../../helpers/helper_functions.dart';
import '../../containers/produact_brand_name.dart';
import '../../icons/product_add_icon.dart';
import '../../text/product_price.dart';
import '../../text/product_title.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.productDetailViewPath),
      child: Container(
        width: 292,
        height: 120,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: darkMode ? AppColors.darkerGrey : AppColors.white,
          borderRadius: BorderRadius.circular(
            CustomSizes.productImageRadius,
          ),
        ),
        child: Row(
          children: [
            //Thumbnail
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(CustomSizes.sm),
              backgroundColor: darkMode ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  const RoundedImage(
                    image: AppImages.productImage1,
                    applyBorderRadius: true,
                  ),
                  const Positioned(
                    top: 8,
                    child: OfferText(
                      offer: "50",
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: FavourtesIcon(onPressed: () {}),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 172,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: CustomSizes.sm, left: CustomSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitle(
                          title: 'Green Nick Air Shoes ',
                          smallsize: true,
                        ),
                        ProductBarndNameAndVerfiedIcon(
                          brandName: 'Nick',
                          brandTextSize: TextSizes.medium,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Productprice(price: '35.0')),
                      ProductAddIcon(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
