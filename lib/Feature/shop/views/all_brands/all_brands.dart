import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/common/widgets/containers/brand_card.dart';
import 'package:e_commerce/core/utils/common/widgets/text/section_heading.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/common/layouts/grid_view.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'widgets/sortable_products.dart';

class AllBrandsView extends StatelessWidget {
  const AllBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("Brands"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: SortableProducts(),
        ),
      ),
    );
  }
}
