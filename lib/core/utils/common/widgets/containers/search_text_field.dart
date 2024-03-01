import 'package:e_commerce/core/utils/helpers/helper_functions.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool darkMode = HelperFunctions.isDarkMode(context);
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
          fillColor: darkMode ? Colors.white : AppColors.black,
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
