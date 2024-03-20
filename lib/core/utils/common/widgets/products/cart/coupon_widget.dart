import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../helpers/helper_functions.dart';
import '../../containers/round_container.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return RoundedContainer(
      showBorder: true,
      backgroundColor: darkMode ? AppColors.dark : Colors.white,
      padding: const EdgeInsets.only(
        top: CustomSizes.sm,
        bottom: CustomSizes.sm,
        right: CustomSizes.sm,
        left: CustomSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a Promo code ? Enter here",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: darkMode
                    ? AppColors.white.withOpacity(0.5)
                    : AppColors.dark.withOpacity(0.5),
                backgroundColor: AppColors.grey.withOpacity(0.1),
                side: BorderSide(
                  color: AppColors.grey.withOpacity(0.1),
                ),
              ),
              child: const Text("Applay"),
            ),
          )
        ],
      ),
    );
  }
}
