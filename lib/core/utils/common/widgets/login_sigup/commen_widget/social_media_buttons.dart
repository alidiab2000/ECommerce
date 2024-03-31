import 'package:flutter/material.dart';

import '../../containers/social_buton.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';

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
