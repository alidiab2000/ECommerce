import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/common/routes/app_router.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class VerifyViewBody extends StatelessWidget {
  const VerifyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.clear,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                AppTexts.confirmEmail,
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
                AppTexts.confirmEmailSubTitle,
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
                    AppRoute.successViewPath,
                  ),
                  child: const Text(
                    AppTexts.tContinue,
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
      ),
    );
  }
}
