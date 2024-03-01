import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemBuilder,
    required this.crossAxisCount,
    required this.itemCount,
    this.mainAxisExtent = 250,
  });
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final double? mainAxisExtent;
  final int crossAxisCount;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: CustomSizes.gridViewSpacing,
        crossAxisSpacing: CustomSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
