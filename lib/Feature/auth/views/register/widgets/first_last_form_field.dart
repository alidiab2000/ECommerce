import 'package:e_commerce/Feature/auth/controllers/register/register_controller.dart';
import 'package:e_commerce/core/utils/validators/validation.dart';

import '../../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FirstAndLastForm extends StatelessWidget {
  const FirstAndLastForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;
    return Row(
      children: [
        Expanded(
          //First Name
          child: CustomFormField(
            validator: (firstName ) => Validator.validateName("First Name", firstName),
            controller: controller.firstName,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Iconsax.user),
            labelText: AppTexts.firstName,
          ),
        ),
        const SizedBox(
          width: CustomSizes.spaceBtwInputFields,
        ),
        Expanded(
          //Last Name
          child: CustomFormField(
            validator: (lastName) => Validator.validateName("Last Name", lastName),
            controller: controller.lastName,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Iconsax.user),
            labelText: AppTexts.lastName,
          ),
        ),
      ],
    );
  }
}
