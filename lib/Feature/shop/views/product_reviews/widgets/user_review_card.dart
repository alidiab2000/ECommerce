import 'package:e_commerce/core/utils/common/widgets/containers/round_container.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/constants/sizes.dart';
import 'user_rating.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    required this.userName,
    required this.userImage,
    this.onPressed,
  });
  final String userName, userImage;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.defaultSpace),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userImage),
                  ),
                  const SizedBox(width: CustomSizes.spaceBtwItems),
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          const UserRating(
            rating: 2.5,
            dataOfPosting: '10 Nov , 2024',
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          RoundedContainer(
            showBorder: false,
            padding: const EdgeInsets.all(CustomSizes.md),
            backgroundColor: HelperFunctions.isDarkMode(context)
                ? AppColors.darkGrey
                : AppColors.grey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Diab Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "10 Nov , 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: CustomSizes.spaceBtwItems),
                const ReadMoreText(
                  'Create an account or log in to Instagram - A simple, fun & creative way to capture, edit & share photos, videos & messages with friends & family',
                  trimMode: TrimMode.Line,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
