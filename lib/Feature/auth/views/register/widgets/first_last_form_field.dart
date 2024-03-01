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
    return const Row(
      children: [
        Expanded(
          child: CustomFormField(
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Iconsax.user),
            labelText: AppTexts.firstName,
          ),
        ),
        SizedBox(
          width: CustomSizes.spaceBtwInputFields,
        ),
        Expanded(
          child: CustomFormField(
            keyboardType: TextInputType.name,
            prefixIcon: Icon(Iconsax.user),
            labelText: AppTexts.lastName,
          ),
        ),
      ],
    );
  }
}
