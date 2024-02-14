import 'package:e_commerce/core/utils/common/app_router.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:e_commerce/core/utils/constants/text_strings.dart';
import 'package:e_commerce/core/utils/helpers/helper_functions.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.deliveredEmailIllustration,
              width: HelperFunctions.screenWidth * 0.6,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            Text(
              AppTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            Text(
              'Exsample@gmail.com',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            Text(
              AppTexts.changeYourPasswordSubTitle,
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
                  AppTexts.done,
                ),
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            TextButton(
              child: const Text(AppTexts.resendEmail),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
