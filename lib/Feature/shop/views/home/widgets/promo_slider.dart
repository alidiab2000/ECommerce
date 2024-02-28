import 'package:carousel_slider/carousel_slider.dart';
import '../../../controllers/home_view_controller/home_view_controller.dart';
import '../../../../../core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/common/widgets/containers/circular_container.dart';
import '../../../../../core/utils/constants/sizes.dart';
import 'rounded_image.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                controller.updatePageIndecator(index),
          ),
          items: banners
              .map(
                (image) => RoundedImage(
                  image: image,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Center(
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
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
