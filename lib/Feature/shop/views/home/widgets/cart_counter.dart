import '../../../../../core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });
  final void Function()? onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor,
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            backgroundColor: AppColors.black,
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
