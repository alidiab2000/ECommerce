import 'package:e_commerce/Feature/auth/controllers/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/social_media_buttons.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../login/widgets/loing_form_divider.dart';
import 'agreement.dart';
import 'first_last_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          //First  and last name form field
          const FirstAndLastForm(),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          //username form field
          CustomFormField(
            controller: controller.userName,
            validator: (username) =>
                Validator.validateName("Username", username),
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Iconsax.user_edit),
            labelText: AppTexts.username,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          //email form field
          CustomFormField(
            controller: controller.email,
            validator: (email) => Validator.validateEmail(email),
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Iconsax.direct),
            labelText: AppTexts.email,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          //phone no form field
          CustomFormField(
            controller: controller.phoneNumber,
            validator: (phoneNum) => Validator.validatePhoneNumber(phoneNum),
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Iconsax.call),
            labelText: AppTexts.phoneNo,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          //password form field
          Obx(
            () => CustomFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (password) => Validator.validatePassword(password),
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Iconsax.password_check),
              labelText: AppTexts.password,
              suffix: GestureDetector(
                onTap: () => controller.hidePassword.value =
                    !controller.hidePassword.value,
                child: Icon(controller.hidePassword.value
                    ? Iconsax.eye
                    : Iconsax.eye_slash),
              ),
            ),
          ),
          const SizedBox(
            height: CustomSizes.defaultSpace,
          ),
          //Check box and polciy
          const AgreementAndPolciy(),
          //==========================
          const SizedBox(
            height: CustomSizes.defaultSpace,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await controller.registerWithEmailAndPassword();
              },
              child: const Text(
                AppTexts.createAccount,
              ),
            ),
          ),
          const FormDivider(
            dividerText: AppTexts.orSignInWith,
          ),
          const SocialMediaButtons(),
        ],
      ),
    );
  }
}
