import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/validators/validation.dart';
import '../../../personailzation/controllers/user/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("ReAuth Login Form"),
      ),
      body: Form(
        key: controller.reAuthFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Column(
              children: [
                CustomFormField(
                  controller: controller.reAuthEmailController,
                  validator: (email) => Validator.validateEmail(email),
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Iconsax.direct_right),
                  labelText: AppTexts.email,
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                Obx(
                  () => CustomFormField(
                    controller: controller.reAuthPasswordController,
                    obscureText: controller.reAuthHidePassword.value,
                    validator: (value) => Validator.validatePassword(value),
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(
                      Iconsax.password_check,
                    ),
                    labelText: AppTexts.password,
                    suffix: GestureDetector(
                      onTap: () => controller.reAuthHidePassword.value =
                          !controller.reAuthHidePassword.value,
                      child: Icon(controller.reAuthHidePassword.value
                          ? Iconsax.eye
                          : Iconsax.eye_slash),
                    ),
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.reAuthenticateEmailAndPasswordUser,
                    child: const Text("Verifiy"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
