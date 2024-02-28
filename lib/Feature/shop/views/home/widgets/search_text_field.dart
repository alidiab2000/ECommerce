import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceUtils.getScreenWidth(context) * 0.9,
      child: TextField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              CustomSizes.cardRadiusLg,
            ),
          ),
          focusColor: Colors.black,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: const Icon(Iconsax.search_normal),
          hintText: "Search in Store",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                color: AppColors.black,
              ),
          labelStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AppColors.black),
        ),
      ),
    );
  }
}
