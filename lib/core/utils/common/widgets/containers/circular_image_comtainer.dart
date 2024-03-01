import 'package:e_commerce/core/utils/constants/sizes.dart';
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
      ),
      child: Center(
        child: Image(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          fit: BoxFit.fill,
          color: darkMode ? AppColors.white : AppColors.white,
        ),
      ),
    );
  }
}
