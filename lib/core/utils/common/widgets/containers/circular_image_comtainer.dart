import 'package:cached_network_image/cached_network_image.dart';
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
    this.color,
    this.fit = BoxFit.cover,
    this.imageColor,
  });
  final String image;
  final double width;
  final double height;
  final double padding;
  final bool isNetworkImage;
  final Color? color;
  final Color? imageColor;
  final BoxFit fit;
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
                  width: width,
                  height: height,
                  imageUrl: image,
                  color: imageColor,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const ShimmerEffect(width: 100, height: 100),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error_outline,
                    color: darkMode ? AppColors.black : AppColors.white,
                    size: 18,
                  ),
                ),
              )
            : Image(
                image: AssetImage(image) as ImageProvider,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
