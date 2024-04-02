import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/validators/validation.dart';
import '../../../controllers/forget_password/forget_password_controller.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(
          CustomSizes.defaultSpace,
        ),
        child: Form(
          key: controller.forgetPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              //Space
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(
                AppTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              //Email field
              CustomFormField(
                controller: controller.emailController,
                validator: (value) => Validator.validateEmail(value),
                keyboardType: TextInputType.emailAddress,
                labelText: AppTexts.email,
                prefixIcon: const Icon(Iconsax.direct_right),
              ),
              //Space
              const SizedBox(height: CustomSizes.spaceBtwSections),
              //Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.sendPasswordResetEmail,
                  child: const Text(
                    AppTexts.submit,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
