import '../../../../../core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.shopping_bag),
          color: darkMode ? AppColors.darkGrey : AppColors.black,
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            backgroundColor: darkMode ? AppColors.darkGrey : AppColors.black,
            radius: 9,
            child: Text(
              '2',
              style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: AppColors.white,
                    fontSizeFactor: 0.8,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
