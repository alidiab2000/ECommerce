import 'package:e_commerce/core/utils/common/layouts/grid_view.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'brand_card.dart';

class StoreGridLayOut extends StatelessWidget {
  const StoreGridLayOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: 4,
      mainAxisExtent: 60,
      crossAxisCount: 2,
      itemBuilder: (context, index) => const BrandCard(
        brandName: 'Nick',
        brandDescripstion: "231 Product",
        brandImage: AppImages.nikeLogo,
      ),
    );
  }
}
