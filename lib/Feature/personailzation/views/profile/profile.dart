import 'package:e_commerce/Feature/personailzation/controllers/user/user_controller.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/loaders/shimmer.dart';
import 'package:e_commerce/core/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/utils/common/widgets/containers/circular_image_comtainer.dart';
import '../../../../core/utils/common/widgets/text/section_heading.dart';
import '../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/profile_menu.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isEmpty
                            ? AppImages.user
                            : networkImage;
                        return controller.imageUploading.value
                            ? const ShimmerEffect(
                                width: 80, height: 80, raduis: 80)
                            : CircularImageContainer(
                                image: image,
                                isNetworkImage: networkImage.isNotEmpty,
                                width: 100,
                                height: 100,
                              );
                      },
                    ),
                    const SizedBox(
                      height: CustomSizes.spaceBtwItems,
                    ),
                    TextButton(
                      child: Text(
                        'Chanage Profile Picture',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      onPressed: () async =>
                          controller.uploadUserProfilePicture(),
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
              Obx(
                () => ProfileMenu(
                  title: "Name",
                  value: controller.user.value.fullName,
                  onTap: () => Get.offNamed(AppRoute.changeProfileNameViewPath),
                ),
              ),
              ProfileMenu(
                title: "Username",
                value: controller.user.value.userName,
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
              ProfileMenu(
                title: "User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onTap: () async {
                  await Clipboard.setData(
                      ClipboardData(text: controller.user.value.id));
                  Loaders.successSnackBar(
                      title: "Done", message: "ID Copied to Clipboard");
                },
              ),
              ProfileMenu(
                title: "E-mail",
                value: controller.user.value.email,
              ),
              const ProfileMenu(
                title: "Phone Number",
                value: "01023814981",
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
                onPressed: () async {
                  controller.deletAccountWarinngPopup();
                },
                child: Text(
                  "Close Account",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
