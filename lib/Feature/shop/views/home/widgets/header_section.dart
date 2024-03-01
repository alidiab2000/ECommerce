import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import 'catergory_list_view.dart';
import '../../../../../core/utils/common/widgets/containers/curve_edge.dart';
import 'home_appbar.dart';
import '../../../../../core/utils/common/widgets/containers/search_text_field.dart';
import 'text_widgets/section_heading.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HeaderCurveEdgeContainer(
      child: Column(
        children: [
          const HomeAppBar(),
          const SizedBox(height: CustomSizes.defaultSpace),
          // Search Bar
          const SearchTextField(),
          // Space
          const SizedBox(height: CustomSizes.defaultSpace),
          // head of home
          Padding(
            padding: const EdgeInsets.only(left: CustomSizes.defaultSpace),
            child: Column(
              children: const [
                //  == Heading
                SectionHeading(
                  title: AppTexts.popularProducts,
                  color: AppColors.white,
                ),
                // Space
                SizedBox(height: CustomSizes.spaceBtwItems),
                // == Categories
                //TODO Passing List of Catergory
                CatergoryListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
