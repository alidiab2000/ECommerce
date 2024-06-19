import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:e_commerce/Feature/shop/controllers/banner_controller.dart/banner_controller.dart';
import 'package:e_commerce/core/utils/loaders/shimmer.dart';

import '../../../../../core/utils/constants/colors.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:get/get.dart';
import '../../../../../core/utils/common/widgets/containers/circular_container.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'rounded_image.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    
    if (controller.bannerLoading.value) {
      return const ShimmerEffect(width: double.infinity, height: 200);
    }
    if (controller.banners.isEmpty) {
      return const Center(
        child: Text(
          "No Banners Available Right Now",
        ),
      );
    }
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) =>
                controller.updatePageIndecator(index),
          ),
          items: controller.banners
              .map(
                (banner) => RoundedImage(
                  image: banner.imageURL,
                  isNetworkImage: true,
                  onTap: () => Get.toNamed(banner.targetScreen),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Center(
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    CustomCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.caruselSliderCurrnetIndex.value == i
                              ? AppColors.primary
                              : AppColors.grey,
                    ),
                ],
              )),
        )
      ],
    );
  }
}
