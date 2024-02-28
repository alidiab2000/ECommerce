import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/sizes.dart';
import 'catergory_list_view.dart';
import 'curve_edge.dart';
import 'home_appbar.dart';
import 'search_text_field.dart';
import 'text_widgets/section_heading.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HeaderCurveEdgeContainer(
      child: Column(
        children: [
          HomeAppBar(),
          SizedBox(height: CustomSizes.defaultSpace),
          // Search Bar
          SearchTextField(),
          // Space
          SizedBox(height: CustomSizes.defaultSpace),
          // head of home
          Padding(
            padding: EdgeInsets.only(left: CustomSizes.defaultSpace),
            child: Column(
              children: [
                //  == Heading
                SectionHeading(),
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
