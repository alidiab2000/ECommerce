import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Feature/shop/views/home/widgets/rounded_image.dart';
import '../../../constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const RoundedImage(
        image: AppImages.user,
      ),
      title: Text(
        'Ali Diab',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        "alidiab8899@gamil.com",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        icon: const Icon(Iconsax.edit),
        onPressed: () {},
      ),
    );
  }
}
