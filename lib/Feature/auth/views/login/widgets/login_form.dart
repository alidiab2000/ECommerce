import '../../../../../core/utils/common/routes/app_router.dart';
import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../register/register.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //Email

          const CustomFormField(
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Iconsax.direct_right,
            ),
            labelText: AppTexts.email,
          ),

          const SizedBox(
            height: CustomSizes.defaultSpace,
          ),

          const CustomFormField(
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icon(
              Iconsax.password_check,
            ),
            labelText: AppTexts.password,
          ),

          const SizedBox(
            height: CustomSizes.defaultSpace / 2,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (val) {},
                  ),
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
              onPressed: () => Get.offAllNamed(
                AppRoute.navigationMenuPath,
              ),
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
                Get.to(
                  () => const RegisterView(),
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
