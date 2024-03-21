import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'catergory_item.dart';

class CatergoryListView extends StatelessWidget {
  const CatergoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            onTap: () => Get.toNamed(AppRoute.subCatergoriesViewPath),
            image: AppImages.shoeIcon,
            catergoryName: 'Shoses',
          );
        },
        itemCount: 6,
      ),
    );
  }
}
