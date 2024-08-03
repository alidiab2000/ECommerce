import 'package:e_commerce/Feature/shop/controllers/categories_controller/categories_controller.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../core/utils/common/widgets/list_tile/setting_menu_tile.dart';
import '../../../shop/controllers/banner_controller.dart/banner_controller.dart';
import '../../../shop/controllers/product_controller/product_controller.dart';

class LoadDataView extends StatelessWidget {
  const LoadDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Load Data"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Main Records",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SettingMenuTile(
                icon: Iconsax.category,
                title: "Upload Categories",
                onTap: () async {
                  final catergoriesController = Get.put(CategoriesController());
                  await catergoriesController.uploadDummyData();
                },
                trailing: const Icon(Iconsax.document_upload),
              ),
              const SettingMenuTile(
                icon: Iconsax.shop,
                title: "Upload Brands",
                onTap: null,
                trailing: Icon(Iconsax.document_upload),
              ),
              SettingMenuTile(
                icon: Iconsax.shopping_bag,
                title: "Upload Products",
                onTap: () async {
                  final productsController = Get.put(ProductController());
                  await productsController.uploadDummyData();
                  productsController.featuredProducts();
                },
                trailing: const Icon(Iconsax.document_upload),
              ),
              SettingMenuTile(
                icon: Iconsax.camera,
                title: "Upload Banners",
                onTap: () async {
                  final bannerController = Get.put(BannerController());
                  await bannerController.uploadDummyData();
                },
                trailing: const Icon(Iconsax.document_upload),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
