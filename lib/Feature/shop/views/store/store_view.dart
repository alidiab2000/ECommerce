import 'package:e_commerce/Feature/shop/controllers/categories_controller/categories_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../../../../core/utils/common/widgets/icons/cart_counter.dart';
import 'widgets/brand_section.dart';
import 'widgets/catgory_tab.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackArrow: false,
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: const [
            CartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrollabe) => [
            const BrandSection(),
          ],
          body: TabBarView(
            children: categories
                .map(
                  (category) => CategoryTab(category: category),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
