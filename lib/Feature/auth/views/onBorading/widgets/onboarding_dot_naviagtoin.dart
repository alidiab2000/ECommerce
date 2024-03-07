import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utility.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/on_boarding_controller.dart';

class OnBoardingBotNavigation extends StatelessWidget {
  const OnBoardingBotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight + 25,
      left: CustomSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: (index) {
          controller.dotNavigationClick(index);
        },
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          dotHeight: 10,
        ),
      ),
    );
  }
}
