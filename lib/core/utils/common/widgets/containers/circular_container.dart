import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.borderRadius = 400,
    this.padding = const EdgeInsets.all(0),
    this.child,
    this.backgroundColor = AppColors.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
