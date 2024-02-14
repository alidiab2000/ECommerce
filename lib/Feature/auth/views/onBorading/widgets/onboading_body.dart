import '../../../controllers/onboarding/on_boarding_controller.dart';
import 'onboarding_dot_naviagtoin.dart';
import 'onboarding_next_button.dart';
import 'onboarding_page.dart';
import 'onboarding_skip.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnBoardingController controller = Get.put(OnBoardingController());

    return Stack(
      children: [
        PageView(
          onPageChanged: controller.updatePageIndicator,
          controller: controller.pageController,
          children: const [
            OnBoardingPage(
              image: AppImages.onBoardingImage1,
              title: AppTexts.onBoardingTitle1,
              subTitle: AppTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: AppImages.onBoardingImage2,
              title: AppTexts.onBoardingTitle2,
              subTitle: AppTexts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: AppImages.onBoardingImage3,
              title: AppTexts.onBoardingTitle3,
              subTitle: AppTexts.onBoardingSubTitle3,
            ),
          ],
        ),
        const OnBoardingSkip(),
        const OnBoardingBotNavigation(),
        const OnBoardingNextButton()
      ],
    );
  }
}
