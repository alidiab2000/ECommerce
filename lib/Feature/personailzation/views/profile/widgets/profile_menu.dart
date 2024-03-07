import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.onTap,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
  });
  final void Function()? onTap;
  final String title, value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: CustomSizes.spaceBtwItems * 0.8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Expanded(
              child: Icon(
                icon,
                size: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
