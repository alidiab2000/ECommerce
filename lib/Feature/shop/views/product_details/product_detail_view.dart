import 'package:e_commerce/core/utils/common/widgets/text/section_heading.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../controllers/product_controller/product_controller.dart';
import '../../models/product_model/product_model.dart';
import 'widgets/Product_meta_Data.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_title_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/common/widgets/containers/produact_brand_name.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../home/widgets/rounded_image.dart';
import 'widgets/product_attrbutes.dart';
import 'widgets/prouduct_image_slider.dart';
import 'widgets/rating_and_share.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments as ProductModel;
    final controller = Get.put(ProductController());
    // final darkMode = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(images: product.images!, product: product),
            Padding(
              padding: const EdgeInsets.only(
                  right: CustomSizes.defaultSpace,
                  left: CustomSizes.defaultSpace,
                  bottom: CustomSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating and share Buttons
                  const RatingAndShare(),
                  // Product meta data
                  ProductMetaData(
                    product: product,
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  ProductTitleText(title: product.title),
                  const SizedBox(
                    height: CustomSizes.spaceBtwItems,
                  ),
                  Row(
                    children: [
                      const ProductTitleText(title: 'Status'),
                      const SizedBox(width: CustomSizes.spaceBtwItems),
                      Text(
                        controller.getStockStatus(product),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  //Produact Attrbutes
                  Row(
                    children: [
                      const RoundedImage(
                        image: AppImages.nikeLogo,
                        width: 18,
                      ),
                      const SizedBox(
                        width: CustomSizes.spaceBtwItems,
                      ),
                      ProductBarndNameAndVerfiedIcon(
                        brandName: product.brand!.name,
                        brandTextSize: TextSizes.medium,
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                   ProductAttributes(product: product,),
                  const SizedBox(height: CustomSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  ReadMoreText(
                    product.description!,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "...Less",
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: "Reviews (199)"),
                      IconButton(
                          onPressed: () =>
                              Get.toNamed(AppRoute.productReviewsViewPath),
                          icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAddToCart(),
    );
  }
}
