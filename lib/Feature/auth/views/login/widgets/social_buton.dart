import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.iconImage,
    required this.onPressed,
  });
  final String iconImage;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image.asset(
          iconImage,
          height: CustomSizes.iconMd,
          width: CustomSizes.iconMd,
        ),
      ),
    );
  }
}
