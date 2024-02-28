import '../../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'cart_counter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: false,
      actions: [
        CartCounterIcon(
          iconColor: AppColors.white,
          onPressed: () {},
        ),
      ],
      title: Column(
        children: [
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColors.white),
          )
        ],
      ),
    );
  }
}
