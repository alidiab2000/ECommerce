import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FavourtesIcon extends StatelessWidget {
  const FavourtesIcon({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Iconsax.heart5,
        color: Colors.red,
      ),
    );
  }
}
