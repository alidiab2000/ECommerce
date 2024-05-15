import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.raduis = 15,
    this.color,
  });
  final double width, height, raduis;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: darkMode ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: darkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (darkMode ? AppColors.darkerGrey : AppColors.white),
          borderRadius: BorderRadius.circular(raduis),
        ),
      ),
    );
  }
}
