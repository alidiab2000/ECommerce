import '../../../../../core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    required this.image,
    this.onTap,
    this.applyBorderRadius = true,
    this.borderRadius = CustomSizes.sm,
    this.isNetworkImage = false,
    this.width,
    this.height,
  });
  final VoidCallback? onTap;
  final String image;
  final bool applyBorderRadius;
  final double borderRadius;
  final bool isNetworkImage;
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: applyBorderRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
        ),
        child: Image(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
        ),
      ),
    );
  }
}
