import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/utils/common/routes/app_router.dart';
import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          //Email
          CustomFormField(
            controller: controller.emailController,
            validator: (value) => Validator.validateEmail(value),
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(
              Iconsax.direct_right,
            ),
            labelText: AppTexts.email,
          ),

          const SizedBox(
            height: CustomSizes.defaultSpace,
          ),

          Obx(() => CustomFormField(
                controller: controller.passwordController,
                obscureText: controller.hidePassword.value,
                validator: (value) => Validator.validatePassword(value),
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Iconsax.password_check,
                ),
                labelText: AppTexts.password,
                suffix: GestureDetector(
                  onTap: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  child: Icon(controller.hidePassword.value
                      ? Iconsax.eye
                      : Iconsax.eye_slash),
                ),
              )),

          const SizedBox(
            height: CustomSizes.defaultSpace / 2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (val) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      )),
                  const Text(
                    AppTexts.rememberMe,
                  ),
                ],
              ),
              TextButton(
                onPressed: () => Get.toNamed(
                  AppRoute.forgetPasswordViewPath,
                ),
                child: const Text(
                  AppTexts.forgetPassword,
                ),
              )
            ],
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.loginWithEmailAndPassword,
              child: const Text(
                AppTexts.signIn,
              ),
            ),
          ),
          const SizedBox(
            height: CustomSizes.defaultSpace,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.offNamed(
                  AppRoute.registerViewPath,
                );
              },
              child: const Text(
                AppTexts.createAccount,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
