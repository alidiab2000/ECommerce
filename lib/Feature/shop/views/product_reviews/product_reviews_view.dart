import 'package:e_commerce/Feature/shop/views/product_reviews/widgets/custom_rating_indicator.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/over_all_product_rating.dart';
import 'widgets/user_review_card.dart';

class ProductReviewsView extends StatelessWidget {
  const ProductReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Reviews & Rating"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  """Rating  the product and reviews Rating  the product and reviews Rating  the product and reviews Rating  the product and reviews Rating  the product and reviews Rating  the product and reviews
                """),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              // Over all product rating
              const OverAllProductRating(text: '4.5'),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const CustomRatingBarIndicator(rating: 3.5),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Text('12,564',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              //User review card
              const UserReviewCard(
                userImage: AppImages.userProfileImage2,
                userName: 'Ali Diab',
              ),
              const UserReviewCard(
                userImage: AppImages.userProfileImage2,
                userName: 'Ali Diab',
              ),
              const UserReviewCard(
                userImage: AppImages.userProfileImage2,
                userName: 'Ali Diab',
              ),
              const UserReviewCard(
                userImage: AppImages.userProfileImage2,
                userName: 'Ali Diab',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
