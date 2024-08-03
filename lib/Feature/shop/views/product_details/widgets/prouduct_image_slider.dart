// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../../core/utils/common/widgets/containers/curve_edge.dart';
import '../../../../../core/utils/common/widgets/icons/favourtes_icons.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../models/product_model/product_model.dart';
import '../../home/widgets/rounded_image.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.images,
    required this.product,
  });
  final List<String> images;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return HeaderCurveEdgeContainer(
      child: Container(
        color: darkMode ? AppColors.darkerGrey : AppColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            CustomAppBar(
              showBackArrow: true,
              actions: [
                FavourtesIcon(
                  onPressed: () {},
                )
              ],
            ),
            Positioned(
              right: 0,
              left: CustomSizes.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: images.length,
                  itemBuilder: (_, index) => RoundedImage(
                    isNetworkImage: true,
                    width: 70,
                    backgroundColor:
                        darkMode ? AppColors.dark : AppColors.white,
                    border: Border.all(color: AppColors.primary),
                    image: images[index],
                  ),
                  separatorBuilder: (_, index) => const SizedBox(
                    width: CustomSizes.spaceBtwItems,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
