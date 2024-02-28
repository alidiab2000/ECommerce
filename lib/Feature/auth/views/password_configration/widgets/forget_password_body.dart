import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../../core/utils/common/routes/app_router.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(
          CustomSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            Text(
              AppTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            const CustomFormField(
              keyboardType: TextInputType.emailAddress,
              labelText: AppTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.offAllNamed(
                  AppRoute.resetPasswordviewPath,
                ),
                child: const Text(
                  AppTexts.submit,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
