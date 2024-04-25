import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/loaders/shimmer.dart';

import '../../../constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../helpers/helper_functions.dart';

class CircularImageContainer extends StatelessWidget {
  const CircularImageContainer({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.width = 56,
    this.height = 56,
    this.padding = CustomSizes.sm,
  });
  final String image;
  final double width;
  final double height;
  final double padding;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: darkMode ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: isNetworkImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const ShimmerEffect(width: 100, height: 100),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            : Image(
                image: const AssetImage(AppImages.user) as ImageProvider,
                fit: BoxFit.fill,
                color: darkMode ? AppColors.white : AppColors.white,
              ),
      ),
    );
  }
}
