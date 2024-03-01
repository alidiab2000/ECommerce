import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.padding,
    this.margin,
    this.showBorder = true,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = CustomSizes.defaultSpace,
    this.borderColor = AppColors.white,
    this.width,
    this.height,
    this.child
  });
  final double? width, height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color backgroundColor, borderColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: showBorder
            ? Border.all(
                color: borderColor,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
