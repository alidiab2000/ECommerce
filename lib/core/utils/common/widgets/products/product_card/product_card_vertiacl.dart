import 'package:e_commerce/Feature/shop/controllers/product_controller/product_controller.dart';
import 'package:e_commerce/Feature/shop/models/product_model/product_model.dart';
import 'package:e_commerce/core/utils/common/widgets/text/offer_text.dart';
import 'package:flutter/cupertino.dart';
import '../../../../constants/enums.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../icons/favourtes_icons.dart';
import '../../icons/product_add_icon.dart';
import '../../../../../../Feature/shop/views/home/widgets/rounded_image.dart';
import '../../text/product_price.dart';
import '../../text/product_title.dart';
import '../../../styles/shadow_style.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../containers/produact_brand_name.dart';
import '../../../routes/app_router.dart';

class ProductCardVertiacl extends StatelessWidget {
  const ProductCardVertiacl({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    return GestureDetector(
      onTap: () =>
          Get.toNamed(AppRoute.productDetailViewPath, arguments: product),
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
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: CustomSizes.sm),
                      child: RoundedImage(
                        isNetworkImage: true,
                        image: product.thumbnail,
                      ),
                    ),
                  ),
                  // Offer
                  Positioned(
                      top: 10,
                      child: OfferText(
                          offer: controller
                              .calculateSalesPercentage(
                                product.price,
                                product.salePrice,
                              )
                              .toString()))
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
            Padding(
              padding: const EdgeInsets.only(left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(
                    title: product.title,
                    smallsize: true,
                  ),
                  Row(
                    children: [
                      ProductBarndNameAndVerfiedIcon(
                        brandName: product.brand?.name ?? '',
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
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: CustomSizes.sm),
                        child: Productprice(
                            price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),
                const ProductAddIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
