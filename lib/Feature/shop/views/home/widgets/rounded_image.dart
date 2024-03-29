import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';

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
    this.padding,
    this.border,
    this.backgroundColor,
  });
  final VoidCallback? onTap;
  final BoxBorder? border;
  final String image;
  final Color? backgroundColor;
  final bool applyBorderRadius;
  final double borderRadius;
  final bool isNetworkImage;
  final double? width, height;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
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
