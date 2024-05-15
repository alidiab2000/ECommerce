 
import '../../../../../Feature/personailzation/controllers/update_name/update_name_controller.dart';
import '../../../../../Feature/personailzation/controllers/user/user_controller.dart';
import '../../../loaders/shimmer.dart';
import '../../routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/image_strings.dart';
import '../containers/circular_image_comtainer.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final updateNameController = Get.put(UpdateNameController());
    return ListTile(
      leading: Obx(
        () {
          final networkImage = userController.user.value.profilePicture;
          final image = networkImage.isEmpty ? AppImages.user : networkImage;
          return userController.imageUploading.value
              ? const ShimmerEffect(width: 80, height: 80, raduis: 80)
              : CircularImageContainer(
                  image: image,
                  padding: 2,
                  isNetworkImage: networkImage.isNotEmpty,
                );
        },
      ),
      title: Obx(
        () {
          return updateNameController.isUserNameChanged.value
              ? const ShimmerEffect(
                  height: 20,
                  width: 40,
                )
              : Text(
                  userController.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall,
                );
        },
      ),
      subtitle: Text(
        userController.user.value.email,
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
