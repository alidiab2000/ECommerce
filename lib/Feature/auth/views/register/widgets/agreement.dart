import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AgreementAndPolciy extends StatelessWidget {
  const AgreementAndPolciy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            onChanged: (value) {},
            value: true,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${AppTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: AppTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark ? AppColors.white : AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? AppColors.white : AppColors.primary,
                    ),
              ),
              TextSpan(
                text: " ${AppTexts.and} ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: AppTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark ? AppColors.white : AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? AppColors.white : AppColors.primary,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
