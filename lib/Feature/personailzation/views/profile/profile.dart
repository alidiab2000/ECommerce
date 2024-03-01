import 'package:e_commerce/Feature/shop/views/home/widgets/rounded_image.dart';
import 'package:e_commerce/Feature/shop/views/home/widgets/text_widgets/section_heading.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/profile_menu.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const RoundedImage(
                    width: 70,
                    image: AppImages.user,
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwItems,
                  ),
                  Text(
                    'Chanage Profile Picture',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            const Divider(),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            const SectionHeading(
              title: "Profile Information",
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            const ProfileMenu(
              title: "Name",
              value: 'Ali Diab',
            ),
            const ProfileMenu(
              title: "Username",
              value: 'Ali Diab',
            ),
            const Divider(),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            const SectionHeading(
              title: "Presonal Information",
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            const ProfileMenu(
              title: "User ID",
              value: '1541',
            ),
            const ProfileMenu(
              title: "E-mail",
              value: 'alidiab@gmail.com',
            ),
            const ProfileMenu(
              title: "Phone Number",
              value: '+2041054645',
            ),
            const ProfileMenu(
              title: "Gender",
              value: 'Male',
            ),
            const ProfileMenu(
              title: "Date odf Birth",
              value: '10/3/2003',
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            const Divider(),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Close Account",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.red),
                ))
          ],
        ),
      ),
    );
  }
}
