 
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../helpers/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.size = CustomSizes.lg,
    this.iconColor,
    required this.icon,
    this.onPressed,
  });
  final double? width, height, size;
  final Color? backgroundColor, iconColor;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ??
            (darkMode
                ? AppColors.black.withOpacity(0.9)
                : AppColors.white.withOpacity(0.9)),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
