import '../../../../../core/utils/common/routes/app_router.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/social_media_buttons.dart';
import '../../login/widgets/loing_form_divider.dart';
import 'agreement.dart';
import 'first_last_form_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //First  and last name form field
          const FirstAndLastForm(),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          const CustomFormField(
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Iconsax.user_edit),
            labelText: AppTexts.username,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          const CustomFormField(
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Iconsax.direct),
            labelText: AppTexts.email,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          const CustomFormField(
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Iconsax.call),
            labelText: AppTexts.phoneNo,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          const CustomFormField(
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icon(Iconsax.password_check),
            labelText: AppTexts.password,
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
              onPressed: () {
                Get.toNamed(
                  AppRoute.verifyViewPath,
                );
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
