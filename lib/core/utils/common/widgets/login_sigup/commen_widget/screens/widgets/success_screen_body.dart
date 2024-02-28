import 'functions/success_padding.dart';
import '../../../../../routes/app_router.dart';
import '../../../../../../constants/image_strings.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_strings.dart';
import '../../../../../../helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreenBody extends StatelessWidget {
  const SuccessScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: successScreenPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.staticSuccessIllustration,
              width: HelperFunctions.screenWidth * 0.6,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            Text(
              AppTexts.yourAccountCreatedTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            Text(
              AppTexts.yourAccountCreatedSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAllNamed(
                  AppRoute.loginViewPath,
                ),
                child: const Text(
                  AppTexts.tContinue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
