import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: CustomSizes.spaceBtwItems,
        bottom: CustomSizes.spaceBtwItems,
      ),
      child: Row(
        children: [
          Flexible(
            child: Divider(
              color: dark ? AppColors.darkGrey : AppColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5,
            ),
          ),
          Text(
            dividerText.capitalize!,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Flexible(
            child: Divider(
              color: dark ? AppColors.darkGrey : AppColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60,
            ),
          ),
        ],
      ),
    );
  }
}
