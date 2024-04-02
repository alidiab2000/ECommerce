import 'package:e_commerce/Feature/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/common/routes/app_router.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({
    super.key,
  }); 

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments as String;
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

            //Space
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(
              AppTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            //Space
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(
              'alidiab8899@gmail.com',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            //Space
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(
              AppTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            //Space
            const SizedBox(height: CustomSizes.spaceBtwSections),
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
            const SizedBox(height: CustomSizes.spaceBtwItems),
            TextButton(
              child: const Text(AppTexts.resendEmail),
              onPressed: () => ForgetPasswordController.instance
                  .resendPassRestEmail(email: email),
            )
          ],
        ),
      ),
    );
  }
}
