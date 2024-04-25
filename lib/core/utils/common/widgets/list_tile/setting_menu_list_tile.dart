import 'package:e_commerce/Feature/personailzation/controllers/user/user_controller.dart';
import 'package:e_commerce/core/utils/common/widgets/containers/circular_image_comtainer.dart';
import '../../../loaders/shimmer.dart';
import '../../routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(
        () {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isEmpty ? AppImages.user : networkImage;
          return controller.imageUploading.value
              ? const ShimmerEffect(width: 80, height: 80, raduis: 80)
              : CircularImageContainer(
                  image: image,
                  isNetworkImage: networkImage.isNotEmpty,
                  width: 100,
                  height: 100,
                );
        },
      ),
      title: Obx(
        () => Text(
          controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        icon: const Icon(Iconsax.edit),
        onPressed: () => Get.toNamed(
          AppRoute.profileViewPath,
        ),
      ),
    );
  }
}
