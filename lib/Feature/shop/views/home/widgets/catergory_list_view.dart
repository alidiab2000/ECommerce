import 'package:e_commerce/Feature/shop/controllers/categories_controller/categories_controller.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../../../core/utils/loaders/category_shimmer.dart';
import 'catergory_item.dart';

class CatergoryListView extends StatelessWidget {
  const CatergoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const CategoryShimmer();
        }

        if (controller.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              "No Categories Found",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          );
        }

        return SizedBox(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = controller.featuredCategories[index];
              return CategoryItem(
                onTap: () => Get.toNamed(AppRoute.subCatergoriesViewPath),
                image: category.image,
                catergoryName: category.name,
              );
            },
            itemCount: controller.featuredCategories.length,
          ),
        );
      },
    );
  }
}
