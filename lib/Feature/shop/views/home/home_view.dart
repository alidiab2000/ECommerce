import 'package:flutter/material.dart';
import '../../../../core/utils/constants/sizes.dart';
import 'widgets/catergory_list_view.dart';
import 'widgets/curve_edge.dart';
import 'widgets/home_appbar.dart';
import 'widgets/search_text_field.dart';
import 'widgets/section_heading.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderCurveEdgeContainer(
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
                        //ToDo Passing List of Catergory
                        CatergoryListView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
