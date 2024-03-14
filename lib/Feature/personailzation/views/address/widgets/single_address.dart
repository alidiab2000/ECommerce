import 'package:e_commerce/core/utils/common/widgets/containers/round_container.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:e_commerce/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);
    return RoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? AppColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : darkMode
              ? AppColors.darkerGrey
              : AppColors.grey,
      padding: const EdgeInsets.all(CustomSizes.md),
      margin: const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? AppColors.light : AppColors.dark,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ali daib",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.md / 2),
              const Text(
                "+20 1023814981",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: CustomSizes.md / 2),
              const Text(
                "11 zag  , Sharqia  , Egypt 11 zag  , Sharqia  , Egypt 11 zag  , Sharqia  , Egypt",
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
