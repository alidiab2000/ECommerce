import '../login/widgets/social_buton.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          iconImage: AppImages.google,
          onPressed: () {},
        ),
        const SizedBox(
          width: CustomSizes.defaultSpace,
        ),
        SocialButton(
          iconImage: AppImages.facebook,
          onPressed: () {},
        ),
      ],
    );
  }
}
