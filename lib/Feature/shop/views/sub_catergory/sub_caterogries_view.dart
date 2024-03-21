import 'package:e_commerce/Feature/shop/views/home/widgets/rounded_image.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/catergories_section.dart';

class SubCatergriesView extends StatelessWidget {
  const SubCatergriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Sports"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            CustomSizes.defaultSpace,
          ),
          child: Column(
            children: [
              //Banner
              RoundedImage(
                  image: AppImages.promoBanner3, width: double.infinity),
              SizedBox(height: CustomSizes.spaceBtwSections),
              //Sub Categories
              CatergoriesSections(
                title: "Sports Shoses",
              ),
              SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              CatergoriesSections(
                title: "Sports Shoses",
              ),
              SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              CatergoriesSections(
                title: "Sports Shoses",
              ),
              SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              CatergoriesSections(
                title: "Sports Shoses",
              ),
              SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              CatergoriesSections(
                title: "Sports Shoses",
              ),
              SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
