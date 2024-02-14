import '../../../controllers/onboarding/on_boarding_controller.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      top: DeviceUtils.getAppBarHeight,
      right: CustomSizes.defaultSpace,
      child: TextButton(
        onPressed: controller.skipOnBoarding,
        child: const Text(
          "Skip",
        ),
      ),
    );
  }
}
