import 'package:e_commerce/Feature/personailzation/controllers/user/user_controller.dart';
import 'package:e_commerce/core/utils/loaders/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/common/widgets/icons/cart_counter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      showBackArrow: false,
      actions: const [
        CartCounterIcon(),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const ShimmerEffect(width: 80, height: 16);
            }
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.white),
            );
          })
        ],
      ),
    );
  }
}
