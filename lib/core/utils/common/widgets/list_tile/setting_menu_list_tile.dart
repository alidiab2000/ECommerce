import 'package:e_commerce/Feature/personailzation/controllers/user/user_controller.dart';
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
      leading: Obx(() => CircleAvatar(
            radius: 30,
            backgroundImage: controller.user.value.profilePicture == ""
                ? const AssetImage(AppImages.user)
                : NetworkImage(controller.user.value.profilePicture),
          )),
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
